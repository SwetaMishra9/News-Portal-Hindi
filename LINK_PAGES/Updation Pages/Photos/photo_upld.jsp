
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%

    //System.out.println("JSP PAGE FOR GET PHOTO");
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/hindi_portal";
ResultSet rs = null;
PreparedStatement psmnt = null; 


                         
                         //String id=(String)session.getAttribute("nid");
                        // int idn=Integer.parseInt(id);

                            int idn=2;
                         String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

FileOutputStream fileOut = new FileOutputStream(saveFile);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

PreparedStatement psmnt1 = null;
FileInputStream fis;

    
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "admin");
File f = new File(saveFile);

psmnt = connection.prepareStatement("update images set image=? where id= ?");
//psmnt.setString(1,saveFile);
fis = new FileInputStream(f);
psmnt.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
psmnt.setInt(2,idn);
int s = psmnt.executeUpdate();
if(s>0)
{
 
     out.println("images uploaded");
     

       
}
}




%>