/*
========================================================================
History                                                           
-------                                                           
VERSION     AUTHOR          DATE                DETAIL                                
   1.0 -    Jenna Vuong     03-31-15            IfTrackedFeedPreventComment(), prevent users from commenting on tracked feed posts
======================================================================== */

public class FeedCommentHandler {
    
    private boolean m_isExecuting = false;
    private integer batchSize = 0;
    
    // constructor
    public FeedCommentHandler(boolean isExecuting, Integer size) {
        m_isExecuting = isExecuting;
        batchSize = size;
    }
    
    // prevent comment on tracked feed posts
    public void IfTrackedFeedPreventComment(List<FeedComment> newComments) {
        
        Set<Id> feedItemIDs = new Set<Id>();
        List<FeedItem> feedItems = new List<FeedItem>();
        Map<Id, FeedComment> feedItemCommentMap = new Map<Id, FeedComment>(); // from FeedItem id, get the related FeedComment record
        
        // get FeedItemId
        for (FeedComment c : newComments) {

            if (c.FeedItemId != null) {
                
                feedItemIDs.add(c.FeedItemId);
                feedItemCommentMap.put(c.FeedItemId, c);
            }
        }
        
        // get all feed item records
        feedItems = [ Select Id, Type From FeedItem Where Id In :feedItemIDs ];
        
        if (feedItems != null && feedItems.size() > 0) {
      
            for (FeedItem i : feedItems) {
                
                if (i.Type == 'TrackedChange') {
                    
          FeedComment actualRecord = feedItemCommentMap.get(i.Id);            
                    actualRecord.addError('ERROR! You cannot comment on a tracked feed post. Please create a separate post instead.');
                }  
            }
        } 
    }
}
