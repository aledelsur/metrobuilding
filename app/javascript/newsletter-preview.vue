<template>
  <div>
    <b-modal id="modal-tall" scrollable title="Vista Previa">

      <div class="admin-newsletter-view">
          <!-- Header -->
        <div class="container">
          <div class="row">

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
              <!-- <b-img :src="logo_url" fluid alt="Responsive image"></b-img> -->
            </div>

            <div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4">
              <h1 class="text-center">{{newsletter_title}}</h1>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col text-center">
              <h1 class="title-newsletter">METRO 19</h1>
            </div>
          </div>
        </div>

        <div class="container">
          <div class="row">
            <div class="col text-center dividing-bar">
            </div>
          </div>
        </div>

        <!-- Cover Image -->
        <div class="container">
          <!-- <b-img :src="main_image" fluid alt="Responsive image"></b-img> -->
        </div>

        <!-- Newsletter Sections -->
        <div class="container-fluid sections">
          <div class="container">
            <div v-for="section in sections" :key="section.id">
              <div class="section">
                <div class="title text-center">
                  {{section.title}}
                </div>
                <div class="description">
                  {{section.description}}  
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Footer -->
        <div class='footer-newsletter text-center'>
          <p>FIDEICOMISO METRO 19 - INFORMACIÓN PRODUCIDA POR METRO BUILDING S.A.</p>
        </div>
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function(){
    return {
      newsletter_id: null,
      newsletter_title: null,
      sections: [],
      logo_url: null,
      main_image: null
    }
  },
  mounted: function() {
    axios({ method: 'get',
            url: '/admin/newsletters/' + this.$root.newsletterId+ '/preview.json'
          })
    .then(response => {
      console.log(response.data)
      this.newsletter_title = response.data.title
      this.newsletter_id = response.data.id
      this.sections = response.data.newsletter_sections
      this.logo_url = response.data.logo_url
      this.main_image = response.data.main_image
      debugger
    })
  }
}
</script>

<style>
.admin-newsletter-view {
  background-color: #f0f2ea;
}
.admin-newsletter-view .container{
  width: 95%;
}
.admin-newsletter-view .logo-img {
  width: 230px;
  display: block;
  margin: auto;
}
.admin-newsletter-view .cover-image {
  max-width: 50%;
  margin: 15px auto 15px auto;
  display: block;
}
.admin-newsletter-view .title-newsletter {
  font-size: 70px;
  color: #262626;
}
.admin-newsletter-view .dividing-bar {
  height: 15px;
  border-radius: 0.25rem;
}
.admin-newsletter-view .sections .section .title{
  background-color: #657ebe;
  color: white;
  border: 1px solid #6c6d70;
  border-radius: 0.25rem;
  text-transform: uppercase;
  margin-bottom: inherit;
  margin-top: 40px;
}
.admin-newsletter-view .sections .section .description{
  margin-top: 2%;
}
.admin-newsletter-view .dividing-bar {
  background-color: #657ebe;
  color: white;
}
.admin-newsletter-view .footer-newsletter {
  height: 52px;
  background-color: #262626;
  border-top: 1px solid #000;
  color: white;
}
.admin-newsletter-view .footer-newsletter p {
  padding-top: 12px;
}
</style>