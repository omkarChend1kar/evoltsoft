import { errorResponse, successResponse } from "../helpers/ResponseBuilder.js";
import geolib from "geolib";

const generateRandomLocations = (lat, lon, radius, count = 10) => {
  let locations = [];

  for (let i = 0; i < count; i++) {
    const randomDistance = Math.random() * radius; // Random distance within radius
    const randomDirection = Math.random() * 360; // Random angle (0 to 360 degrees)

    const newPoint = geolib.computeDestinationPoint(
      { latitude: parseFloat(lat), longitude: parseFloat(lon) },
      randomDistance,
      randomDirection
    );

    locations.push({
      id: i + 1,
      name: `Charging Station ${i + 1}`,
      address: `Random Address ${i + 1}`,
      latitude: newPoint.latitude,
      longitude: newPoint.longitude,
      connectors: [
        {
          type: "Type2",
          powerCapacity: parseFloat((Math.random() * 100).toFixed(2)),
          totalPlugs: 4,
          availablePlugs: Math.floor(Math.random() * 4),
        },
      ],
      openHours: "24/7",
    });
  }

  return locations;
};

export const dataCenterList = async (req, res) => {
  try {
    const { lat, long, radius } = req.body;
    const chargingStations = generateRandomLocations(lat, long, radius, 10);
    return res.status(200).json(successResponse(chargingStations));
  } catch (err) {
    console.log(err);
    return res.status(500).json(errorResponse("OOPS! Something went wrong"));
  }
};
