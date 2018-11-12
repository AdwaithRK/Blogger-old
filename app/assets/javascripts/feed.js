function renderForm (post_id)
{
    $("#button-for-"+post_id).replaceWith(
    "<form onsubmit='return commentAjax();' id='form-for-"+post_id+"'>Comment:<br><input type='text' name='comment' id='comment'><br><input type='hidden' name='post_id' id='post_id' value='"+post_id+"'><br><input type='submit' value='Submit'></form>"
    )
}


function commentAjax()
{
    let comment=$('#comment').val()
    let post_id=$('#post_id').val();
    console.log("dddddd look here"+comment);
    $.ajax({
        method: "GET",
        url: "/comments/create",
        data: { 
             post_id: post_id,
             comment: comment
            }
        // beforeSend: function(){
        //    $("#form-for-"+post_id).replaceWith(
        //        "<button id=button-for-'"+post_id+"' type='button' onClick='renderForm('"+post_id+"') >Comment</button>"
        //    )
        // }
        }).done(function(){
            $("#form-for-"+post_id).replaceWith(
                       "<button id=button-for-"+post_id+" type='button' onClick='renderForm("+post_id+")' >Comment</button>"
                   )
        }

        )

        return false;

}



function getComments(post_id)
{
    event.preventDefault();

    $.ajax({
        method: "GET",
        url: "/comments/show_post_comments",
        data: { 
             post_id: post_id,
            },
        success: function(data){
            console.log("hellooooooo.................."+post_id);
            console.log("buttons-feed-for-"+post_id);
            console.log(data);
            
        //    $("#buttons-feed-for-"+post_id).empty();
           
           data.forEach(element => {
            $("#buttons-feed-for-"+post_id).prepend("<p>comment :"+element.comment+" by: "+element.user+"</p><br>");
           });
             
            
        }

    })


}