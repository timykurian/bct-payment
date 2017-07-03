function submitForm(amount, productName, productDesc, formId, productUrl, type) {
    console.log("js store type -" + type);
    $('#amount').val(amount);
    $('#productName').val(productName);
    $('#productDesc').val(productDesc);
    $('#productUrl').val(productUrl);
    $('#type').val(type);
    $(formId).submit();
}