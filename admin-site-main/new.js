const form = document.querySelector('#parking-form');
const result = document.querySelector('.result');
form.addEventListener('submit', e => {
    e.preventDefault();
    const vehicleNumber = form.querySelector('#vehicle-number').value;
    const ownerName = form.querySelector('#owner-name').value;
    const ownerType = form.querySelector('#owner-type').value;
    result.textContent = `Parking Slot Assigned to ${ownerName} ${vehicleNumber} ${ownerType}`;
    form.reset();
});