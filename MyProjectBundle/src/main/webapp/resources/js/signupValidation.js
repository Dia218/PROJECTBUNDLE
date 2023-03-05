var checkForm = [false, false, false, false, false, true, true];

let form = document.forms.signup;
form.name.oninput = nameValid;
form.nickname.oninput = nickValid;
form.id.oninput = idValid;
form.password.oninput = passwordValid;
form.pwcheck.oninput = pwcheckValid;
form.email.oninput = emailValid;
form.github.oninput = githubValid;

function nameValid() {
	var name = document.getElementById("name").value;
	var regExp = /^[가-힣]{2,4}$|^[a-zA-Z]+$/;

	if (!regExp.test(name)) {
		document.querySelector(".invalid-name.feedback-custom").style.display = 'block';
		document.querySelector(".invalid-name.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-name.custom-valid").classList.remove("custom-valid");
		checkForm[0] = false;
	}
	else {
		document.querySelector(".invalid-name.feedback-custom").style.display = 'none';
		document.querySelector(".invalid-name.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-name.custom-invalid").classList.remove("custom-invalid");
		checkForm[0] = true;
	}
	allValid();
}
function nickValid() {
	var nickname = document.getElementById("nickname").value;
	var regExp = /^[a-zA-Z]+$/;

	if (!regExp.test(nickname)) {
		document.querySelector(".invalid-nickname.feedback-custom").style.display = 'block';
		document.querySelector(".invalid-nickname.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-nickname.custom-valid").classList.remove("custom-valid");
		checkForm[1] = false;
	}
	else {
		document.querySelector(".invalid-nickname.feedback-custom").style.display = 'none';
		document.querySelector(".invalid-nickname.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-nickname.custom-invalid").classList.remove("custom-invalid");
		checkForm[1] = true;
	}
	allValid();
}
function idValid() {
	var id = document.getElementById("id").value;
	var regExp = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;

	if (!regExp.test(id)) {
		document.querySelector(".invalid-id.feedback-custom").style.display = 'block';
		document.querySelector(".invalid-id.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-id.custom-valid").classList.remove("custom-valid");
		checkForm[2] = false;
	}
	else {
		document.querySelector(".invalid-id.feedback-custom").style.display = 'none';
		document.querySelector(".invalid-id.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-id.custom-invalid").classList.remove("custom-invalid");
		checkForm[2] = true;
	}
	allValid();
}
function passwordValid() {
	var password = document.getElementById("password").value;
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	if (!regExp.test(password)) {
		document.querySelector(".invalid-password.feedback-custom").style.display = 'block';
		document.querySelector(".invalid-password.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-password.custom-valid").classList.remove("custom-valid");
		checkForm[3] = false;
	}
	else {
		document.querySelector(".invalid-password.feedback-custom").style.display = 'none';
		document.querySelector(".invalid-password.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-password.custom-invalid").classList.remove("custom-invalid");
		checkForm[3] = true;
	}
	allValid();
}
function pwcheckValid() {
	var password = document.getElementById("password").value;
	var pwcheck = document.getElementById("pwcheck").value;


	if (pwcheck != password) {
		document.querySelector(".invalid-pwcheck.feedback-custom").style.display = 'block';
		document.querySelector(".invalid-pwcheck.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-pwcheck.custom-valid").classList.remove("custom-valid");
		checkForm[4] = false;
	}
	else {
		document.querySelector(".invalid-pwcheck.feedback-custom").style.display = 'none';
		document.querySelector(".invalid-pwcheck.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-pwcheck.custom-invalid").classList.remove("custom-invalid");
		checkForm[4] = true;
	}
	allValid();
}
function emailValid() {
	var email = document.getElementById("email").value;
	var regExp = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;

	if (email != "" && !regExp.test(email)) {
		document.querySelector(".invalid-email.feedback-normal").style.color = '#dc3545';
		document.querySelector(".invalid-email.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-email.custom-valid").classList.remove("custom-valid");
		checkForm[5] = false;
	}
	else {
		document.querySelector(".invalid-email.feedback-normal").style.display = 'none';
		document.querySelector(".invalid-email.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-email.custom-invalid").classList.remove("custom-invalid");
		checkForm[5] = true;
	}
	allValid();
}
function githubValid() {
	var github = document.getElementById("github").value;
	var regExp = 'https://github.com/';

	if (github != "" && !github.startsWith(regExp)) {
		document.querySelector(".invalid-github.feedback-normal").style.color = '#dc3545';
		document.querySelector(".invalid-github.custom-valid").classList.add("custom-invalid");
		document.querySelector(".invalid-github.custom-valid").classList.remove("custom-valid");
		checkForm[6] = false;
	}
	else {
		document.querySelector(".invalid-github.feedback-normal").style.display = 'none';
		document.querySelector(".invalid-github.custom-invalid").classList.add("custom-valid");
		document.querySelector(".invalid-github.custom-invalid").classList.remove("custom-invalid");
		checkForm[6] = true;
	}
	allValid();
}

function allValid() {
	document.getElementById("form-submit").disabled = true;

	var i = 0;
	while (checkForm[i]) {
		i++;
		if (i == 7) {
			document.getElementById("form-submit").disabled = false;
			break;
		}
	}
}
