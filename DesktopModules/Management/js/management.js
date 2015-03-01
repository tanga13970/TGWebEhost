var currentSelectedItemId = -1;

$(function () {
	$(".jqte-text").jqte();
	
	createManageItemsLayout();

	$('.btn_add_new_seed_in_modal').off('click');
	$('.btn_add_new_seed_in_modal').click(function(){
	    var itemContent = $('.tet_item_content').parent().parent().find('.jqte_editor').html();
		var itemName =  $('.input_item_name').val();
		
		addNewItem(itemName, itemContent);
		
	});
	setItemContentEvent();

	$('.btn_update_seed_in_modal').off('click');
	$('.btn_update_seed_in_modal').click(function () {
	    var currentItemContent = $('.tet_current_item_content').parent().parent().find('.jqte_editor').html();
	    var currentItemName = $('.input_current_item_name').val();

	    updateCurrentSelectedItem(currentItemName, currentItemContent, currentSelectedItemId);

	});
});

function fetchManageItems() {
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: '/DesktopModules/EhostHome/ajax/ProcessAjax.aspx/fetchAllItems',
        
        async: true,
        success: function (response) {

            var items = response.d;
            $('.div-item-to-be-inserted').html('');
            var itemHtmlStr = '';
            $.each(items, function (index, item) {
                itemHtmlStr += updateManageItemsLayout(item.ItemID, item.ItemName, item.ItemContent, item.LastModified);                
            });
            
            $('.div-item-to-be-inserted').html(itemHtmlStr);
            setItemContentEvent();
        },
        error: function (response, textStatus, jqXHR) {
            
            console.log(response.responseText);
        }
    });
}

function updateCurrentSelectedItem(currentItemName, currentItemContent, currentSelectedItemId) {
	$.ajax({
		type: 'POST',
		contentType: "application/json; charset=utf-8",
		url: '/DesktopModules/EhostHome/ajax/ProcessAjax.aspx/updateCurrentSelectedItem',
		data: "{'currentItemName':'" + currentItemName + "','currentItemContent':'" + currentItemContent + "','currentItemID':" + currentSelectedItemId + "}",
		async: true,
		success: function (response) {
			
			if(response.d=='successfully'){
			    $('.tet_current_item_content').parent().parent().find('.jqte_editor').html('');
			    $('.input_current_item_name').val('');
			}
			$('#Div1').modal('hide');

			fetchManageItems();
		},
		error: function (response, textStatus, jqXHR) {
		    $('#Div1').modal('hide');
			console.log(response.responseText);
		}
	});
}

function addNewItem(newItemName, newItemContent) {
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: '/DesktopModules/EhostHome/ajax/ProcessAjax.aspx/addNewItem',
        data: "{'newItemName':'" + newItemName + "','newItemContent':'" + newItemContent + "'}",
        async: true,
        success: function (response) {

            if (response.d == 'successfully') {
                $('.tet_item_content').parent().parent().find('.jqte_editor').html('');
                $('.input_item_name').val('');
            }
            $('#myModal').modal('hide');
			fetchManageItems();
        },
        error: function (response, textStatus, jqXHR) {
            $('#myModal').modal('hide');
            console.log(response.responseText);
        }
    });
}

function setItemContentEvent() {
    $('[data-toggle="tooltip"]').tooltip();

    $('.work_inner_content_wrapper').off('click');
    $('.work_inner_content_wrapper').click(function () {
        var itemName = $(this).find('.span_name').html();
        var itemContent = $(this).find('.span_content').html();
        currentSelectedItemId = $(this).attr('data-item-id');
        $('.input_current_item_name').val(itemName);
        $('.tet_current_item_content').parent().parent().find('.jqte_editor').html(itemContent);
    });
}

function createManageItemsLayout() {
    $('.div-item-to-be-inserted').html('');
    var itemHtmlStr = '';
    for (var i = 0; i < manageName.length; i++) {
        itemHtmlStr += '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 work_inner_content_wrapper" data-toggle="modal" data-target="#Div1" data-item-id="' + manageID [i]+ '"><div class="col-lg-2 col-sm-2 col-md-2 col-xs-4"><span class="span_name" data-toggle="tooltip" title="' + manageName[i] + '">' + manageName[i] + '</span></div><div class="col-lg-8 col-sm-8 col-md-8 col-xs-8 div_content"><span class="span_content" data-toggle="tooltip" title="' + manageContent[i] + '" data-placement="bottom">' + manageContent[i] + '</span></div><div class="col-lg-2 col-sm-2 col-md-2 col-xs-0 hidden-xs div_date"><span class="span_date" data-toggle="tooltip" title="' + manageLastModified[i] + '">' + manageLastModified[i] + '</span></div></div>';
    }
    $('.div-item-to-be-inserted').html(itemHtmlStr);
}

function updateManageItemsLayout(itemID,itemName,itemContent,itemLastModified) {
    
    var itemHtmlStr = '';
    
    itemHtmlStr = '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 work_inner_content_wrapper" data-toggle="modal" data-target="#Div1" data-item-id="' + itemID + '"><div class="col-lg-2 col-sm-2 col-md-2 col-xs-4"><span class="span_name" data-toggle="tooltip" title="' + itemName + '">' + itemName + '</span></div><div class="col-lg-8 col-sm-8 col-md-8 col-xs-8 div_content"><span class="span_content" data-toggle="tooltip" title="' + itemContent + '" data-placement="bottom">' + itemContent + '</span></div><div class="col-lg-2 col-sm-2 col-md-2 col-xs-0 hidden-xs div_date"><span class="span_date" data-toggle="tooltip" title="' + itemLastModified + '">' + itemLastModified + '</span></div></div>';
    
    return itemHtmlStr;
}