// JavaScript Basics & Setup
console.log("Welcome to the Community Portal");
function pageLoaded() {
  alert("Page loaded successfully!");
}

// Event Array
const events = [
  { name: "Music Night", date: "2025-06-01", seats: 30, category: "Music" },
  { name: "Yoga Session", date: "2025-06-03", seats: 0, category: "Health" }
];

// Display Events
function displayEvents() {
  const eventList = document.getElementById("eventList");
  eventList.innerHTML = "";
  events.forEach(event => {
    if (new Date(event.date) > new Date() && event.seats > 0) {
      const card = document.createElement("div");
      card.className = "eventCard";
      card.innerHTML = `
        <h3>${event.name}</h3>
        <p>Date: ${event.date}</p>
        <p>Seats Available: ${event.seats}</p>
      `;
      eventList.appendChild(card);
    }
  });
}
displayEvents();

// Form Submission
document.getElementById("eventForm").addEventListener("submit", function (e) {
  e.preventDefault();
  const name = this.elements.name.value;
  const email = this.elements.email.value;
  const selectedEvent = this.elements.event.value;
  document.getElementById("formMessage").innerText = `Thank you ${name}, you've registered for ${selectedEvent}.`;
});

// jQuery Fade Example (if jQuery is included)
// $(document).ready(function () {
//   $("#registerBtn").click(function () {
//     $(".eventCard").fadeOut().fadeIn();
//   });
// });
