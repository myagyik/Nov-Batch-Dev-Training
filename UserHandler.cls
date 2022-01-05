public class UserHandler 
{
    @future
	Public static void assignPermissionSetToMarketingProfile(Set<id> userids)
    {
        System.debug('Inside future method');
        
        PermissionSet permset = [SELECT id, Name FROM PermissionSet WHERE Name = 'Marketing_User_Permissions' LIMIT 1];
            
        List<PermissionSetAssignment> newpermissions = new List<PermissionSetAssignment>();
        
        for(Id userid : userids)
        {
            PermissionSetAssignment opermissionsetassignment = new PermissionSetAssignment();
            opermissionsetassignment.PermissionSetId = permset.Id;
            opermissionsetassignment.Assigneeid = userid;
            newpermissions.add(opermissionsetassignment);
        }
            
        if(newpermissions != null)
        {
       	   Insert newpermissions;
        } 
    }
}