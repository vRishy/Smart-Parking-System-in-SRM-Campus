        // Define parking list data
        const parkingList = [{
            id: 1,
            name: 'Dhruv',
            timeLeft: 60,
            vehicleNumber: 'ABC123',
            type: 'Student'
        }, {
            id: 2,
            name: 'Rishi',
            timeLeft: 30,
            vehicleNumber: 'XYZ456',
            type: 'Faculty'
        }, {
            id: 3,
            name: 'Hardhik',
            timeLeft: 120,
            vehicleNumber: 'DEF789',
            type: 'Guest'
        }];

        // Function to generate HTML for a single parking list entry
        function generateParkingEntryHtml(entry) {
            return `
          <tr>
            <td>${entry.id}</td>
            <td>${entry.name}</td>
            <td>${entry.timeLeft} minutes</td>
            <td>${entry.vehicleNumber}</td>
            <td>
              <button class = "aaa" onclick="removeParkingEntry(${entry.id})">Remove</button>
            </td>
          </tr>
        `;
        }

        // Function to generate HTML for parking details
        function generateParkingDetailsHtml(entry) {
            return `
          <p>${entry.id} belongs to ${entry.name} ${entry.timeLeft} minutes for parking with ${entry.vehicleNumber}</p>
        `;
        }

        // Function to add parking list entries to the HTML table
        function populateParkingList() {
            const parkingListHtml = parkingList.map(entry => generateParkingEntryHtml(entry)).join('');
            document.getElementById('parking-list').innerHTML = parkingListHtml;
        }

        // Function to show parking details in the details div
        function showParkingDetails(id) {
            const entry = parkingList.find(e => e.id === id);
            if (entry) {
                const detailsHtml = generateParkingDetailsHtml(entry);
                document.getElementById('parking-details').innerHTML = detailsHtml;
            }
        }

        // Function to remove a parking entry from the list
        function removeParkingEntry(id) {
            const index = parkingList.findIndex(e => e.id === id);
            if (index !== -1) {
                parkingList.splice(index, 1);
                populateParkingList();
                alert(`Parking entry ${id} removed.`);
                // TODO: Update database with the new parking list data
            }
        }

        // Populate the parking list on page load
        populateParkingList();