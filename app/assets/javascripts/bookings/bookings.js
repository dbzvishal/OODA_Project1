function validation() {
    if (document.getElementById('building_id').value === '' || document.getElementById('booking_room_id').value === '') {
        return false;
    }
}
function retrieve_rooms() {
    var selected_item = $('#building_id option:selected').val();
    if (selected_item !== '' && selected_item != undefined) {
        $.ajax(
            {
                url: "/buildings/" + selected_item + ".json",
                success: function (jsonVal) {
                    $('#booking_room_id').find('option').remove().end();
                    $.each(jsonVal, function (i, obj) {
                        $('#booking_room_id').append($("<option></option>").attr("value", obj.id).text(obj.rnumber));
                    })
                }
            });
    }
    else {
        $('#booking_room_id').find('option').remove().end();
    }
}