// These function are to clear and reset input fields for aesthetic purposes

// This function takes a text input element and clears the field if the user
// had not entered anything in the text box, and otherwise leaves it alone.
function clearfield(element) {
    if (element.value == element.defaultValue) {
        element.value = "";
    }
}

// This function takes a text input element and reset the value of the field
// to the default value if the user had not entered anything into the box, and
// otherwise leaves it alone.
function resetfield(element) {
    if (element.value == "") {
        element.value = element.defaultValue;
    }
}

// In addition to the functionality inherited from the base clearfield(),
// this function changes the type of the input from text to password if
// the user had not entered anything. Note that there is no type checking,
// and that the developer must take care to use the proper function for the
// element's type.
function pwclearfield(element) {
    if (element.value == element.defaultValue) {
        element.value = "";
        element.type = "password";
    }
}

// In addition to the functionality inherited from the base resetfield(),
// this function changes the type of the input from password to text if
// the user had not entered anything. Note that there is no type checking,
// and that the developer must take care to use the proper function for the
// element's type.
function pwresetfield(element) {
    if (element.value == "") {
        element.value = element.defaultValue;
        element.type = "text";
    }
}
