$(function(){

  var source = $("#benefits-template").html();
  var template = Handlebars.compile(source);

  // see comment on line 58 below
  // prepend this to <div class="info">

  // var showSource = $("#benefits-show-template").html();
  // var showTemplate = Handlebars.compile(showSource);

  function urlSetter(jsonScope){
    switch (jsonScope){
      case "user":
        return $("a#user_path_target").attr("href") + "/get_json"
      case "all":
        return "benefits/get_json"
      case "show":
        return "benefits/get_json_show"
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
      var selections = response.selections
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
    var benefits = response.benefits || response
    benefits.forEach(function(benefit){
      beneficiariesPopulation(response, benefit)
      $('#benefits_body').append(template(benefit))
    })
  }

  function benefitsShowPopulation(response){
    $('#info').prepend(showTemplate(response))
  }

  // uncomment the appropriate function depending on page... for now
  // should i move the parameters for this function and the url setter function out to the individual views?

  userData(urlSetter("user"), benefitsPopulation)
  // userData(urlSetter("all"), benefitsPopulation)
  // userData(urlSetter("show"), benefitsShowPopulation)

  $("form.edit_user").hide()
  $('div.actions input').removeAttr('data-disable-with');

  $("p.edit_account a").on("click", function(e){
    $("form.edit_user").toggle("fast");
    e.preventDefault();
  })

  $("form.edit_user").on("submit", function(e){
    var url = this.action
    var data = $(this).serialize();
    $.ajax({
      type: "patch",
      url: url,
      data: data,
      success: function(response){
        $("form.edit_user").hide("fast");
        $(".greeting").contents().remove();
        $(".greeting").append(response);
      }
    })
    e.preventDefault();
  })
})
