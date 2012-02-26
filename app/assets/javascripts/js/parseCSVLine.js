function parseCSVLine (line)
{
  line = line.split(',');
  
  // check for splits performed inside quoted strings and correct if needed
  for (var i = 0; i < line.length; i++)
  {
    var chunk = line[i].replace(/^[\s]*|[\s]*$/g, "");
    var quote = "";
    if (chunk.charAt(0) == '"' || chunk.charAt(0) == "'") quote = chunk.charAt(0);
    if (quote != "" && chunk.charAt(chunk.length - 1) == quote) quote = "";
    
    if (quote != "")
    {
      var j = i + 1;
      
      if (j < line.length) chunk = line[j].replace(/^[\s]*|[\s]*$/g, "");
      
      while (j < line.length && chunk.charAt(chunk.length - 1) != quote)
      {
        line[i] += ',' + line[j];
        line.splice(j, 1);
        chunk = line[j].replace(/[\s]*$/g, "");
      }
      
      if (j < line.length)
      {
        line[i] += ',' + line[j];
        line.splice(j, 1);
      }
    }
  }
  
  for (var i = 0; i < line.length; i++)
  {
    // remove leading/trailing whitespace
    line[i] = line[i].replace(/^[\s]*|[\s]*$/g, "");
    
    // remove leading/trailing quotes
    if (line[i].charAt(0) == '"') line[i] = line[i].replace(/^"|"$/g, "");
    else if (line[i].charAt(0) == "'") line[i] = line[i].replace(/^'|'$/g, "");
  }
  
  return line;
}
