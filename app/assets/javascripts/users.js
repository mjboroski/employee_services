var source = $("#benefits-template").html();
var template = Handlebars.compile(source);

function urlSetter(jsonScope){
  switch (jsonScope){
    case "user":
      return $("a#user_path_target").attr("href") + "/get_json"
    case "all":
      return "benefits/get_json"
  }
}

function userData(url, applicationFunction){
  $.ajax({
    type: 'get',
    url: url,
    dataType: 'json',
    success: function(response){
      applicationFunction(response)
  }})
}

function beneficiariesPopulation(response, benefit){
  var selections = response.selections || nil
  selections.forEach(function(selection){
    if (selection.benefit_id == benefit.id){
      benefit.beneficiaries = selection.beneficiaries || 0
    }
  })
}

function benefitsPopulation(response){
  var benefits = response.benefits || response
  benefits.forEach(function(benefit){
    beneficiariesPopulation(response, benefit)
    $('#benefits_body').append(template(benefit))
  })
}

$(function(){
  userData(urlSetter("user"), benefitsPopulation)

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
