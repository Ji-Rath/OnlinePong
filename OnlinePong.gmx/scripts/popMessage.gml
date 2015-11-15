var retVal;

if (ds_queue_empty(global.messageQueue))
{
    retVal = "did not work";
} else {
    if (ds_queue_size(global.messageQueue) > 1)
    {
        retVal = ds_queue_dequeue(global.messageQueue) + "#" + ds_queue_dequeue(global.messageQueue);
    } else {
        retVal = ds_queue_dequeue(global.messageQueue);
    }
}

return retVal;
