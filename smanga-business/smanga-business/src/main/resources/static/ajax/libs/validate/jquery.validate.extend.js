/*this is basic form validation using for validation person's basic information author:Trong Hieu data:2017/07/20*/
$(document).ready(function () {
	$.validator.setDefaults({
		submitHandler: function (form) {
			form.submit();
		}
	});
	// Regular merge of mobile phone number verification ID card: (^\d{15}$)|(^\d{17}([0-9]|X)$)
	jQuery.validator.addMethod("isPhone", function (value, element) {
		var length = value.length;
		var phone = /^(\+91-|\+91|0)?\d{10}$/;
		return this.optional(element) || ((length == 11 || length == 10) && phone.test(value));
	}, "Please fill in the correct 10 or 11-digit mobile phone number");
	//Phone number verification
	jQuery.validator.addMethod("isTel", function (value, element) {
		var tel = /^(0\d{2,3}-)?\d{7,8}$/g;//Area code 3, 4 digits, number 7, 8 digits
		return this.optional(element) || (tel.test(value));
	}, "Please fill in the correct landline number");
	//Name verification
	jQuery.validator.addMethod("isName", function (value, element) {
		var name = /[a-zA-Z|\s]{6,30}$/;
		return this.optional(element) || (name.test(value));
	}, "The name can only use Chinese characters, the length is 6-30 digits");
	//Verify user name
	jQuery.validator.addMethod("isUserName", function (value, element) {
		var userName = /^[a-zA-Z0-9]{2,13}$/;
		return this.optional(element) || (userName).test(value);
	}, 'Please enter numbers or letters, excluding special characters');

	//Check ID
	jQuery.validator.addMethod("isIdentity", function (value, element) {
		var id = /^(\d{10}$|^\d{12}$)$/;
		return this.optional(element) || (id.test(value));
	}, "Please enter the correct 10 or 12-digit ID number");
	//Check date of birth
	jQuery.validator.addMethod("isBirth", function (value, element) {
		var birth = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		return this.optional(element) || (birth).test(value);
	}, "Example of date of birth format 2000-01-01");
	//Verify IP address
	jQuery.validator.addMethod("isIp", function (value, element) {
		var ip = /^(?:(?:2[0-4][0-9]\.)|(?:25[0-5]\.)|(?:1[0-9][0-9]\.)|(?:[1-9][0-9]\.)|(?:[0-9]\.)){3}(?:(?:2[0-4][0-9])|(?:25[0-5])|(?:1[0-9][0-9])|(?:[1-9][0-9])|(?:[0-9]))$/;
		return this.optional(element) || (ip).test(value);
	}, "IP地址格式示Example 127.0.0.1");
	jQuery.validator.addMethod("notEqual", function (value, element, param) {
		return value != param;
	}, $.validator.format("输入值Not allowed to be {0}"));
	jQuery.validator.addMethod("gt", function (value, element, param) {
		return value > param;
	}, $.validator.format("Input value must be greater than {0}"));
	//Verify that the old and new passwords are the same
	jQuery.validator.addMethod("isdiff", function () {
		var p1 = $("#pwdOld").val();
		var p2 = $("#pwdNew").val();
		if (p1 == p2) {
			return false;
		} else {
			return true;
		}
	});
	//Verify that the new password and confirm password are the same
	jQuery.validator.addMethod("issame", function () {
		var p3 = $("#confirm_password").val();
		var p4 = $("#pwdNew").val();
		if (p3 == p4) {
			return true;
		} else {
			return false;
		}
	});
	//Verify basic information form
	$("#basicInfoForm").validate({
		errorElement: 'span',
		errorClass: 'help-block error-mes',
		rules: {
			name: {
				required: true,
				isName: true
			},
			sex: "required",
			birth: "required",
			mobile: {
				required: true,
				isPhone: true
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			name: {
				required: "Please enter your Chinese name",
				isName: "Name can only be Chinese characters"
			},
			sex: {
				required: "Please enter gender"
			},
			birth: {
				required: "Please enter the year and month of birth"
			},
			mobile: {
				required: "Please enter your phone number",
				isPhone: "Please fill in the correct 11-digit phone number"
			},
			email: {
				required: "Please enter email",
				email: "Please fill in the correct email format"
			}
		},

		errorPlacement: function (error, element) {
			element.next().remove();
			element.closest('.gg-formGroup').append(error);
		},

		highlight: function (element) {
			$(element).closest('.gg-formGroup').addClass('has-error has-feedback');
		},
		success: function (label) {
			var el = label.closest('.gg-formGroup').find("input");
			el.next().remove();
			label.closest('.gg-formGroup').removeClass('has-error').addClass("has-feedback has-success");
			label.remove();
		},
		submitHandler: function (form) {
			alert("Saved successfully!");
		}
	});

	//Verify password modification form
	$("#modifyPwd").validate({
		onfocusout: function (element) { $(element).valid() },
		debug: false, //Indicates whether to submit the form directly after the verification is passed
		onkeyup: false, //Indicates monitoring and verification when the button is released
		rules: {
			pwdOld: {
				required: true,
				minlength: 6
			},
			pwdNew: {
				required: true,
				minlength: 6,
				isdiff: true,
				//issame:true,
			},
			confirm_password: {
				required: true,
				minlength: 6,
				issame: true,
			}

		},
		messages: {
			pwdOld: {
				required: 'Required',
				minlength: $.validator.format('Password length must be greater than 6')
			},
			pwdNew: {
				required: 'Required',
				minlength: $.validator.format('Password length must be greater than 6'),
				isdiff: 'The original password and the new password cannot be repeated',

			},
			confirm_password: {
				required: 'Required',
				minlength: $.validator.format('Password length must be greater than 6'),
				issame: 'The new password must be consistent with the confirmed new password',
			}

		},
		errorElement: "mes",
		errorClass: "gg-star",
		errorPlacement: function (error, element) {
			element.closest('.gg-formGroup').append(error);

		}
	});
});