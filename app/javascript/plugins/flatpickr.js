import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css'

flatpickr(".datepicker", {
  minDate: "today",
  altInput: true,
  dateFormat: "d-m-Y",
  defaultDate: "today",
});

flatpickr(".datepicker2", {
  altInput: true,
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  defaultDate: "13:00",
});


flatpickr(".datepicker3", {
  altInput: true,
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  defaultDate: "14:00",
});
