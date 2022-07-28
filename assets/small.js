$("#device").change(function() {
if ($(this).val() == "yes") {
    $('#showWhenItsDevice').show();
} else {
    $('#showWhenItsDevice').hide();
}
});
$("#device").trigger("change");