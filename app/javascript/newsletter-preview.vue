<template>
  <div>
    <b-modal id="modal-tall" scrollable title="Vista Previa">

      <div class="admin-newsletter-view">

        <!-- Header -->

        <header>
          <div class='container'>

                <div class="title-newsletter-container text-center">
                  <span class='main-title'>METRO 19</span>
                  <br />
                  <span class="subtitle">{{newsletter_title}}</span>
                </div>

          </div>

        </header>



        <!-- <div class="container">
          <div class="row">
            <div class="col text-center dividing-bar">
            </div>
          </div>
        </div> -->

        <!-- Newsletter Sections -->
        <div class='container'>
          <div class="sections">
            <div class="sections-container">
              <div v-for="section in sections" :key="section.id">
                <div class="section">
                  <div class="title text-center">
                    {{section.title}}
                  </div>
                  <div class="description">
                    <div v-html="section.description"></div>
                  </div>

                  <div class="row">
                    <div v-for="asset in section.media_assets" :key="asset.id" class="col-md-4 col-sm-6 col-xs-12">
                      <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded"></b-img>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>

          <div class='triangle'>

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
    })
  }
}
</script>
<style>

</style>
