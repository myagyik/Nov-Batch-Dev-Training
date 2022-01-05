public class ContactRecordDescription  implements database.Batchable<sObject>
{
	Public Database.Querylocator start(Database.BatchableContext bc)
    {
        String query = 'Select name, title, Account.name, Account.description from Contact';
        Return Database.getQueryLocator(query);
    }
    
        Public void execute (Database.BatchableContext bc, List<contact> contacts)
        {
            if (contacts != null)
            {
                For(Contact con: contacts)
                {
                	con.Description = con.Title + ' of ' + con.Account.Name+ ' : ' + con.Account.description;
                    System.debug(con.Description);
                }
                update contacts;
            }
        }
    Public void finish(Database.Batchablecontext bc)
    {
    //Success or failure message
    }
}