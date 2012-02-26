function csvToJson(csvText)
{
  var message = "";
  var error = false;
  var jsonText = "";
  
  if (csvText == "")
  {
    alert('Fichier CSV introuvable !');
    error = 1;
  }
  
  if (!error)
  {
    csvRows = csvText.split(/[\r\n]/g); // split into rows
    
    // get rid of empty rows
    for (var i = 0; i < csvRows.length; i++)
    {
      if (csvRows[i].replace(/^[\s]*|[\s]*$/g, '') == "")
      {
        csvRows.splice(i, 1);
        i--;
      }
    }
    
    if (csvRows.length < 2) { error = true; message = "The CSV text MUST have a header row!"; }
    else
    {
      objArr = [];
      
      for (var i = 0; i < csvRows.length; i++)
      {
        csvRows[i] = parseCSVLine(csvRows[i]);
      }
      
      for (var i = 1; i < csvRows.length; i++)
      {
        if (csvRows[i].length > 0) objArr.push({});
        
        for (var j = 0; j < csvRows[i].length; j++)
        {
          objArr[i - 1][csvRows[0][j]] = csvRows[i][j];
        }
      }
      jsonText = JSON.stringify(objArr, null, "\t");                        
      return jsonText
    }
  }
}
