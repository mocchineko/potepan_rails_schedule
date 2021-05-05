$(function () { 
 
    $("document").on('click', '.destroy', function() {
            if(!confirm('本当に削除しますか？')){
            return false;
                } else {
            $(this).parents('form').submit()
            }
    })
})
        