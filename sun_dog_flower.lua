-- Necessary libraries
local utils = require("utils")

-- Global variables
local hikeOrganizers = {}

-- Function to create a new hike organizer
function addHikeOrganizer(name, experience, specialty)
	local newOrganizer = {
		name = name,
		experience = experience,
		specialty = specialty
	}
	table.insert(hikeOrganizers, newOrganizer)
end

-- Function to display a hike organizer
function showHikeOrganizer(name)
	local organizer = utils.searchTable(hikeOrganizers, "name", name)
	if organizer then
		print("Name: "..organizer.name)
		print("Experience: "..organizer.experience)
		print("Specialty: "..organizer.specialty)
	else
		print("Hike Organizer not found")
	end
end

-- Function to create a new adventure trip
function addAdventureTrip(name, destination, difficulty, organizerNames)
	local trip = {
		name = name,
		destination = destination,
		difficulty = difficulty,
		organizers = {}
	}
	for _, organizerName in ipairs(organizerNames) do
		local organizer = utils.searchTable(hikeOrganizers, "name", organizerName)
		if organizer then
			table.insert(trip.organizers, organizer)
		end
	end
	table.insert(adventureTrips, trip)
end

-- Function to show an adventure trip
function showAdventureTrip(name)
	local trip = utils.searchTable(adventureTrips, "name", name)
	if trip then
		print("Name: "..trip.name)
		print("Destination: "..trip.destination)
		print("Difficulty: "..trip.difficulty)
		print("Organizers: ")
		for _, organizer in ipairs(trip.organizers) do
			print(organizer.name.." - "..organizer.specialty)
		end
	else
		print("Adventure Trip not found")
	end
end

-- Function to list all available adventure trips
function listAdventureTrips()
	for _, trip in ipairs(adventureTrips) do
		print(trip.name)
	end
end

-- Function to accept a request for an adventure trip
function acceptAdventureTripRequest(name, destination, difficulty, organizerNames)
	local tripFound = utils.searchTable(adventureTrips, "name", name)
	if tripFound then
		print("Trip already exists")
	else
		addAdventureTrip(name, destination, difficulty, organizerNames)
		print("Adventure trip accepted")
	end
end

-- Program start
print("Welcome to the Hike Organizers Application!")
print("This application is for a group of outdoor enthusiasts who organize adventure trips and wilderness expeditions to help people reconnect with nature.")
print("You can add/view hike organizers and create/view/list adventure trips.")
local userInput = ""
while userInput ~= "exit" do
	print("Please select one of the following options:")
	print("1. Add Hike Organizer")
	print("2. View Hike Organizer")
	print("3. Add Adventure Trip")
	print("4. View Adventure Trip")
	print("5. List Adventure Trips")
	print("6. Accept Adventure Trip Request")
	print("Type 'exit' to quit")
	userInput = io.read()
	if userInput == "1" then
		print("Enter hike organizer name:")
		local name = io.read()
		print("Enter hike organizer experience:")
		local experience = io.read()
		print("Enter hike organizer specialty:")
		local specialty = io.read()
		addHikeOrganizer(name, experience, specialty)
		print("Hike Organizer added")
	elseif userInput == "2" then
		print("Enter hike organizer name:")
		local name = io.read()
		showHikeOrganizer(name)
	elseif userInput == "3" then
		print("Enter adventure trip name:")
		local name = io.read()
		print("Enter adventure trip destination:")
		local destination = io.read()
		print("Enter adventure trip difficulty:")
		local difficulty = io.read()
		print("Enter names of hike organizers:")
		local organizerNames = {}
		local organizerName
		repeat
			organizerName = io.read()
			if organizerName ~= "" then
				table.insert(organizerNames, organizerName)
			end
		until organizerName == ""
		addAdventureTrip(name, destination, difficulty, organizerNames)
		print("Adventure Trip added")
	elseif userInput == "4" then
		print("Enter adventure trip name:")
		local name = io.read()
		showAdventureTrip(name)
	elseif userInput == "5" then
		listAdventureTrips()
	elseif userInput == "6" then
		print("Enter adventure trip name:")
		local name = io.read()
		print("Enter adventure trip destination:")
		local destination = io.read()
		print("Enter adventure trip difficulty:")
		local difficulty = io.read()
		print("Enter names of hike organizers:")
		local organizerNames = {}
		local organizerName
		repeat
			organizerName = io.read()
			if organizerName ~= "" then
				table.insert(organizerNames, organizerName)
			end
		until organizerName == ""
		acceptAdventureTripRequest(name, destination, difficulty, organizerNames)
	end
end