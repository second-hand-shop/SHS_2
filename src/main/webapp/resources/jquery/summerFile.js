/**
 * 
 */

$("#contents").summernote({
			height:500,
			placeholder: 'write here...',
			callbacks: {
				onImageUpload: function(files) {
				   // upload image to server and create imgNode...
				   //$summernote.summernote('insertNode', imgNode);
				   uploadFile(files);
				   
				 }, // -- onImageUpload
				onMediaDelete: function(files){
					deleteFile(files);
				}
					
			}// -- callbacks
});

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf('/')+1);
	$.post("summerFileDelete", {fileName:fileName}, function(result){
		console.log(result);
	});
}


function uploadFile(files) {
	const formData = new FormData();//Form 태그 생성
	formData.append('file', files[0]); //input type="file" name="file"
	let fileName="";
	$.ajax({
		type: "POST",
		url: "./summerFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success:function(result){
			fileName=result.trim();
			console.log(fileName);
			$("#contents").summernote('insertImage', fileName);
		} 
		
	})
};		
