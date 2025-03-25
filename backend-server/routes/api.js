import express from 'express';
import { dataCenterList } from '../controllers/DataCenterController.js';
import { validateDataCenterName } from '../request/DataCenterValidation.js';

const apiRoutes = express.Router();


//Start Data center route

apiRoutes.post('/v1/get-near-by-charging-station-list',validateDataCenterName,dataCenterList);

//End Data center route

export default apiRoutes;