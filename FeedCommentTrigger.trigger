/*
========================================================================
History                                                           
-------                                                           
VERSION     AUTHOR          DATE                DETAIL                                
   1.0 -    Jenna Vuong     03-31-15            prevent users from commenting on tracked feed chatter posts
======================================================================== */

trigger FeedCommentTrigger on FeedComment (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    
    FeedCommentHandler handler = new FeedCommentHandler(Trigger.isExecuting, Trigger.size);
    
    if (Trigger.isInsert && Trigger.isBefore) {
        
        // prevent null pointer
        if (Trigger.new != null && Trigger.new.size() > 0)
            handler.IfTrackedFeedPreventComment(Trigger.new);
    }

}
