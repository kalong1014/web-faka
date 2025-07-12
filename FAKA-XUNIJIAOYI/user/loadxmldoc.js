function loadXMLDoc(dname) 
{
var xmlDoc=null;
try //Internet Explorer
  {
    xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async=false;
    xmlDoc.load(dname);
  }
catch(e)
  {
   try //Firefox, Mozilla, Opera, etc.
     {
 var xmlhttp = new window.XMLHttpRequest(); 
 xmlhttp.open("GET",dname,false); 
 xmlhttp.send(null); 
 xmlDoc = xmlhttp.responseXML.documentElement; 
     }
   catch(e) {
	   //alert("can't load information!")
	   }
  }
return xmlDoc;
}