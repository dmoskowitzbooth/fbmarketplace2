import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(position => {
        fetch('/location', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
          },
          body: JSON.stringify({
            latitude: position.coords.latitude,
            longitude: position.coords.longitude
          })
        })
      })
    }
  }
}
