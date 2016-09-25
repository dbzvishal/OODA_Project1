sizes = {4:'Small', 6:'Medium', 12:'Large'}
function validation() {
    if (!$('input[name="room_radio"]').is(':checked')) {
        return false;
    }
}

function getRoomsData() {
    $.ajax(
        {
            url: "/rooms.json",
            type: 'GET',
            data: {room_number:$('#room_number').val(), building_name:$('#building_name option:selected').val(), size_name:$('#size_name option:selected').val(), status:$('#status option:selected').val()},
            success: function (jsonVal) {
                $('#delete_next').remove()
                $('#search_table').find('tr:not(#no_delete)').remove()
                $.each(jsonVal, function (i, obj) {
                    console.log(obj)
                    $('#no_delete').after('<tr><td><input type="radio" name="room_radio" value="' + obj.id + '"/></td><td>' + obj.rnumber + '</td><td>' + obj.bname + '</td><td>' + sizes[obj.size] + '</td></tr>');
                });
                if(jsonVal.length==0) {
                    $('#search_table').hide()
                    $('#submit_button').hide()
                    $('#search_table').after('<span id="delete_next"> No results were found </span>')
                } else {
                    $('#search_table').show()
                    $('#submit_button').show()
                }
            }
        });
}