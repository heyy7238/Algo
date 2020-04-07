/**
 * 도전과제 풀기 화면 
 */

// init
window.addEventListener("load",(e)=>{
	const submitCodeBtn = document.getElementById('btn-submit-code');
	const codeEditor = document.getElementById('code-editor');

	// 전송 버튼 클릭
	if(submitCodeBtn){
		submitCodeBtn.addEventListener("click",(e)=>{
			const contextPath = e.currentTarget.getAttribute("data-context-path"); 
			const cNum = e.currentTarget.getAttribute("data-cnum");
			console.log("contextPath:",contextPath ); 
			console.log("cNum:",cNum ); 
			var xhr = new XMLHttpRequest();
			xhr.open('POST',contextPath+"/challenge/code/"+cNum); 		
			const formdata = new FormData();
			codeEditor.value= editor.getValue();
			formdata.append('code',codeEditor.value);
			codeEditor.setAttribute('disabled',false);
			submitCodeBtn.setAttribute('disabled',true);
			// 전송 완료 시
			xhr.addEventListener('load',(e)=>{
				console.log(e.currentTarget.response);
				const {result} = JSON.parse(e.currentTarget.response);
				const contextPath = getContextRootPath();
				console.log(result);
				const evtSource = new EventSource(contextPath+'/challenge/result/realtime/'+result.resultNum);
// const evtSource = new
// EventSource(contextPath+'/challenge/result/realtime/'+148);
				evtSource.onopen = e=>{
// console.log("open: " + e);
// console.dir(e);
				}
				evtSource.onmessage = function(e) {
// console.log("message: " + e.data);
				  const resultMsg = document.querySelector('#result-msg');
				  const responseData = JSON.parse(e.data);
// console.dir(responseData);
// resultMsg.innerHTML = e.data;
				  if(responseData.status==='S' || responseData.status==='F'){
					  resultMsg.innerHTML="상태:"+responseData.resultComment+
					  "<br>메모리 사용량: "+ responseData.usedMemory+
					  "kb<br>실행시간:"+responseData.processingTime+"ns"
					  evtSource.close();
					  
				  }else {
					resultMsg.innerHTML=responseData.resultComment;
					}
// eventList.appendChild(newElement);
				}
				evtSource.onerror = function(err) {
// console.error("EventSource failed:", err);
// evtSource.close();
				  
				};
			});
			//
			xhr.send(formdata);
		});				
	}
	
});
var editor;
		window.addEventListener('load',
		e=>{
			editor = CodeMirror.fromTextArea(document.getElementById("code-editor"), {
				lineNumbers: true,
				extraKeys: {"Ctrl-Space": "autocomplete"},
				mode: {name: "javascript", globalVars: true}
			});

			if (typeof Promise !== "undefined") {
			  var comp = [
			    ["here", "hither"],
			    ["asynchronous", "nonsynchronous"],
			    ["completion", "achievement", "conclusion", "culmination", "expirations"],
			    ["hinting", "advive", "broach", "imply"],
			    ["function","action"],
			    ["provide", "add", "bring", "give"],
			    ["synonyms", "equivalents"],
			    ["words", "token"],
			    ["each", "every"],
			  ]

		  function synonyms(cm, option) {
		    return new Promise(function(accept) {
		      setTimeout(function() {
		        var cursor = cm.getCursor(), line = cm.getLine(cursor.line)
		        var start = cursor.ch, end = cursor.ch
		        while (start && /\w/.test(line.charAt(start - 1))) --start
		        while (end < line.length && /\w/.test(line.charAt(end))) ++end
		        var word = line.slice(start, end).toLowerCase()
		        for (var i = 0; i < comp.length; i++) if (comp[i].indexOf(word) != -1)
		          return accept({list: comp[i],
		                         from: CodeMirror.Pos(cursor.line, start),
		                         to: CodeMirror.Pos(cursor.line, end)})
		        return accept(null)
		      }, 100)
		    })
		  }
			}
		});