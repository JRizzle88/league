// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$( document ).ready(function() {

    var champ1 = false;
    var champ2 = false;

    $('.champions').children().click(function() {
        if (champ1 == false) {
            $('#champ1').val(this.id);
            champ1 = true;
            $(this).hide();
        } else if (champ2 == false) {
            $('#champ2').val(this.id);
            champ2 = true;
            $(this).hide();
        }
    });



    var html_attributes = ["armor", "armor-pen", "ad", "adlvl", "ar", "aslvl", "hp", "hplvl", "hpregen",
        "hpregenlvl", "ms", "mp", "mplvl", "mpregen", "mpregenlvl", "sb", "sblvl"];


    for (var i = 0; i < html_attributes.length; i++) {
        var thing = html_attributes[i];
        var attr1 = "#" + thing + "-1"
        var attr2 = "#" + thing + "-2"


        if (parseInt($(attr1).text()) > parseInt($(attr2).text())) {
            $(attr1).addClass( "green" );
            $(attr2).addClass( "red" );
        } else if (parseInt($(attr1).text()) < parseInt($(attr2).text())) {
            $(attr1).addClass( "red" );
            $(attr2).addClass( "green" );
        } else {
            $(attr1).addClass( "blue" );
            $(attr2).addClass( "blue" );
        }
    }


    //if (parseInt($('#armor-1').text()) > parseInt($('#armor-2').text())) {
    //    $('#armor-1').addClass( "green" );
    //    $('#armor-2').addClass( "red" );
    //} else if (parseInt($('#armor-1').text()) < parseInt($('#armor-2').text())) {
    //    $('#armor-1').addClass( "red" );
    //    $('#armor-2').addClass( "green" );
    //} else {
    //    $('#armor-1').addClass( "blue" );
    //    $('#armor-2').addClass( "blue" );
    //}
    //
    //if (parseInt($('#armor-pen-1').text()) > parseInt($('#armor-pen-2').text())) {
    //    $('#armor-pen-1').addClass( "green" );
    //    $('#armor-pen-2').addClass( "red" );
    //} else if (parseInt($('#armor-pen-1').text()) < parseInt($('#armor-pen-2').text())) {
    //    $('#armor-pen-1').addClass( "red" );
    //    $('#armor-pen-2').addClass( "green" );
    //} else {
    //    $('#armor-pen-1').addClass( "blue" );
    //    $('#armor-pen-2').addClass( "blue" );
    //}

});

$(function(){ $(document).foundation(); });
