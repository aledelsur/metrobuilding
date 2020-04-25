/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import NewsletterPreview from '../newsletter-preview.vue'
import { BootstrapVue } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

import Notifications from 'vue-notification'
Vue.use(Notifications)

import { ModalPlugin } from 'bootstrap-vue'
Vue.use(ModalPlugin)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(NewsletterPreview),
    el: '#newsletter-preview-app',
    data: {
      newsletterId: null,
      viewType: 'admin',
      sentNewsletterToken: null
    },
    components: { NewsletterPreview, BootstrapVue, Notifications, ModalPlugin },
    beforeMount: function () {
      this.newsletterId = this.$el.attributes['newsletter_id'].value;
      this.viewType = this.$el.attributes['view_type'].value;
      this.sentNewsletterToken = this.$el.attributes['sent_newsletter_token'].value;
    }
  })
  document.body.appendChild(app.$el)

  console.log(app)
})
