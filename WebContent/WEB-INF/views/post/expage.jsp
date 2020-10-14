<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello</title>
<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


    <style type="text/css">
        .demo-droppable {
            background: #08c;
            color: #fff;
            padding: 100px 0;
            text-align: center;
        }

        .demo-droppable.dragover {
            background: #00CC71;
        }
        
    </style>
    <form method="POST" action="fileUpload" enctype="multipart/form-data">
    <div id="upImgFile"name="upImgFile" class="demo-droppable">
        <p>Drag files here or click to upload</p>
    </div>
    <div class="output"></div>
    <input type="submit" id="done" class="btn btn-primary btn-sm" type="submit"value="글쓰기">
</form>

    <script type="text/javascript">
	let files;
	let reader;
	let fileInfo;
	var input = document.querySelector('input');
	var preview = document.querySelector('.preview');
	input.style.opacity = 0;

	function EXIFutil() {
		EXIF.getData(files[0], function() {
			var exifLong = EXIF.getTag(files[0], "GPSLongitude");
			var exifLat = EXIF.getTag(files[0], "GPSLatitude");
			var exifLongRef = EXIF.getTag(files[0], "GPSLongitudeRef");
			var exifLatRef = EXIF.getTag(files[0], "GPSLatitudeRef");

			console.log("E:" + exifLong[2])
			console.log("N:" + exifLat[2])

		});

	}
    
        (function (window) {
            function triggerCallback(e, callback) {
                if (!callback || typeof callback !== 'function') {
                    return;
                }
                var files;
                if (e.dataTransfer) {
                    files = e.dataTransfer.files;
                } else if (e.target) {
                    files = e.target.files;
                }
                callback.call(null, files);
            }
            function makeDroppable(ele, callback) {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('multiple', true);
                input.style.display = 'none';
                input.addEventListener('change', function (e) {
                    triggerCallback(e, callback);
                });
                ele.appendChild(input);

                ele.addEventListener('dragover', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    ele.classList.add('dragover');
                });

                ele.addEventListener('dragleave', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    ele.classList.remove('dragover');
                });

                ele.addEventListener('drop', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    ele.classList.remove('dragover');
                    triggerCallback(e, callback);
                });

                ele.addEventListener('click', function () {
                    input.value = null;
                    input.click();
                });
            }
            window.makeDroppable = makeDroppable;
        })(this);
        (function (window) {
            makeDroppable(window.document.querySelector('.demo-droppable'), function (files) {
                console.log(files);
                var output = document.querySelector('.output');
                output.innerHTML = '';
                for (var i = 0; i < files.length; i++) {
                    if (files[i].type.indexOf('image/') === 0) {
                        output.innerHTML += '<img width="200" src="' + URL.createObjectURL(files[i]) + '" />';
                    }
                    output.innerHTML += '<p>' + files[i].name + '</p>';
                }
            });
        })(this);
    </script>
</body>
</html>
