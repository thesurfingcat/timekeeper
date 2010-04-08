// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggleon() {
	var ele = document.getElementById("toggleSearch");
	var text = document.getElementById("displayText");
	var link = document.getElementById("searchlink");

	
    ele.style.display = "block";
    text.style.display = "none";
    link.style.display = "none";

} 

function toggleoff() {
	var ele = document.getElementById("toggleSearch");
	var text = document.getElementById("displayText");
	var link = document.getElementById("searchlink");

    ele.style.display = "none";
    text.style.display = "";
    link.style.display = "";
} 


// Copy Home address to correspondence address

var addressLine1 = "";
var addressLine2 = "";
var addressLine3 = "";
var addressLine4 = "";
var Country = "";
var Postcode = "";

function InitSaveVariables(form) {
	addressLine1 = form.app_correspondence_addr1.value;
	addressLine2 = form.app_correspondence_addr2.value;
	addressLine3 = form.app_correspondence_addr3.value;
	addressLine4 = form.app_correspondence_addr4.value;
	Counrty = form.app_correspondence_countrycode.value;
	Postcode = form.app_correspondence_postcode.value;
}

function CopyAddress(form) {
if (form.copy.checked) {
	InitSaveVariables(form);
	form.app_correspondence_addr1.value = form.app_home_addr1.value;
	form.app_correspondence_addr2.value = form.app_home_addr2.value;
	form.app_correspondence_addr3.value = form.app_home_addr3.value;
	form.app_correspondence_addr4.value = form.app_home_addr4.value;
	form.app_correspondence_countrycode.value = form.app_home_countrycode.value;
	form.app_correspondence_postcode.value = form.app_home_postcode.value;
} else {
	form.app_correspondence_addr1.value = addressLine1;
	form.app_correspondence_addr2.value = addressLine2;
	form.app_correspondence_addr3.value = addressLine3;
	form.app_correspondence_addr4.value = addressLine4;
	form.app_correspondence_countrycode.value = Country;
	form.app_correspondence_postcode.value = Postcode;
	}
}

function paging(dropdown){	
		window.location = ('apps?faculty=' + $("faculty").value + '&coursetitle=' + $("coursetitle").value + '&campus=' + $("campus").value + '&given_names=' + $("given_names").value + '&surname=' + $("surname").value+ '&given_names=' + $("given_names").value + '&personalid=' + $("personalid").value + '&app_scheme_code=' + $("app_scheme_code").value + '&per_page=' + dropdown);			
}  

function ucaspaging(dropdown){	
		window.location = ('ucasapps?faculty=' + $("faculty").value + '&coursetitle=' + $("coursetitle").value + '&campus=' + $("campus").value + '&given_names=' + $("given_names").value + '&surname=' + $("surname").value+ '&given_names=' + $("given_names").value + '&personalid=' + $("personalid").value + '&app_scheme_code=' + $("app_scheme_code").value + '&per_page=' + dropdown);			
}                      