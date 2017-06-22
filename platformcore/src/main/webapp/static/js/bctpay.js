
function submitForm(amount, productName, productDesc, formId, productUrl) {

    $('#amount').val(amount);
    $('#productName').val(productName);
    $('#productDesc').val(productDesc);
    $('#productUrl').val(productUrl);
    $(formId).submit();
}