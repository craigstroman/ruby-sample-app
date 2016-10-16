/**
Place all the behaviors and hooks related to the matching controller here.
All this logic will automatically be available in application.js.
**/
(function() {
	"use strict";

	var formFields = document.getElementsByTagName("input");
	var formFieldsLength = formFields.length;

	for ( var i =0; i < formFieldsLength; i++ ) {
		formFields[i].addEventListener("blur", function() {
			if ( this.type === "text" || this.type === "email" || this.type === "password" ) {
				if ( this.value.length === 0 ) {
					if ( this.className.indexOf("field-error") === -1 ) {
						this.classList.add("field-error");
					}
				} else {
					this.classList.remove("field-error");
				}
			}
		}, false);
	}
})();
