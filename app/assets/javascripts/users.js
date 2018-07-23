$(function(){

  function urlSetter(jsonScope){
    switch (jsonScope){
      case "user":
        $("a#user_path_target").attr("href") + "/get_json"
        break;
      case "all":
        $("a#user_path_target").attr("href") + "/get_json"
        break;
    }
  }

  function userData(url, application){
    $.ajax({
      type: 'get',
      url: url,
      dataType: 'json',
      success: function(response){
        application(response)
    }})
  }

  function selectionsPopulation(response){
    var selections = response.selections
  }

  function benefitsPopulation(response){
    var benefits = response.benefits

  }

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
