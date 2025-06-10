const express =require('express')
const update_status_router=express.Router()
const UpdateStatusController= require('../controller/update_status_controller');

update_status_router.put('/updateByUserIdtodoId',UpdateStatusController.updateTodoStatus);

module.exports=update_status_router;