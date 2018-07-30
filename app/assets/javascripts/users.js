document.addEventListener("turbolinks:load", function() {

  $("form.edit_user").hide()
  $('div.actions input').removeAttr('data-disable-with');

  $("p.edit_account a").on("click", function(e){
    $("form.edit_user").toggle("fast");
    e.preventDefault();
  })

  function User(admin, userName) {
    this.admin = admin;
    this.userName = userName;
  }

  User.prototype.renderGreeting = function() {
    let returnString = "<p><strong>Welcome, </strong>"+this.userName+"!</p>"
    let addonString = "<p><strong>ADMIN</strong></p>\n"
    if (this.admin){
      returnString = addonString.concat(returnString)
    }
    return returnString
  }

  $("form.edit_user").on("submit", function(e){
    let url = this.action
    let data = $(this).serialize();
    $.ajax({
      type: "patch",
      url: url,
      data: data,
      success: function(response){
        $("form.edit_user").hide("fast");
        $(".greeting").contents().remove();
        let json = JSON.parse(response);
        let currentUser = new User(json.admin, json.name)
        let injection = currentUser.renderGreeting()
        $(".greeting").append(injection);
      }
    })
    e.preventDefault();
  })

  function urlSetter(jsonScope){
    switch (jsonScope){
      case "user":
        return $("a#user_path_target").attr("href") + "/get_json"
      case "all":
        return "benefits/get_json"
      case "show":
        return benefit_id+"/get_json_show"
    }
  }

  function userData(url, appliedFunction){
    $.ajax({
      type: 'get',
      url: url,
      dataType: 'json',
      success: function(response){
        appliedFunction(response)
    }})
  }

  function beneficiariesPopulation(response, benefit){
    if (!!response.selections){
      let selections = response.selections
      selections.forEach(function(selection){
        if (selection.benefit_id == benefit.id){
          benefit.beneficiaries = selection.beneficiaries || 0
        }
      })
    }else{
      benefit.beneficiaries = "N/A"
    }
  }

  function benefitsPopulation(response){
    let benefits = response.benefits || response
    benefits.forEach(function(benefit){
      beneficiariesPopulation(response, benefit)
      $('#benefits_body').append(template(benefit))
    })
  }

  function benefitsShowPopulation(response){
    $('div.info').prepend(template(response))
  }

  function routeMaker(){
    if (setter == "show"){
      return userData(urlSetter(setter), benefitsShowPopulation)
    }else{
      return userData(urlSetter(setter), benefitsPopulation)
    }
  }

  $("form#new_benefit").hide()
  $('div.actions input').removeAttr('data-disable-with');

  $("#new_benefit_link a").on("click", function(e){
    $("form#new_benefit").toggle("fast");
    e.preventDefault();
  });

  $("form#new_benefit").on("submit", function(e){
    let url = this.action
    let data = $(this).serialize();
    $.ajax({
      type: "post",
      url: url,
      data: data,
      success: function(response){
        $("form.new_benefit").hide("fast");
        $('#benefits_body').append(template(response))
      }
    })
    e.preventDefault();
  });

  routeMaker();

  var table = $('table');

  $('th.sortable')
    .wrapInner('<span title="sort this column"/>')
    .each(function(){
        var th = $(this),
            thIndex = th.index(),
            inverse = false;
        th.click(function(){
            table.find('td').filter(function(){
                return $(this).index() === thIndex;
            }).sortElements(function(a, b){
                if( $.text([a]) == $.text([b]) )
                    return 0;
                return $.text([a]) > $.text([b]) ?
                    inverse ? -1 : 1
                    : inverse ? 1 : -1;
            }, function(){
                return this.parentNode;
            });
            inverse = !inverse;
        });
    });
})
