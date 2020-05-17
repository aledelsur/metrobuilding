<template>
  <div>
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
                  <div v-if="section.media_assets.length == 1" v-for="asset in section.media_assets" :key="asset.id" class="col-md-12 text-center">
                    <div class="image">
                      <div class="text">
                        {{asset.description}}
                      </div>
                      <a :href="asset.image" target="_blank"><b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded section-img"></b-img></a>
                    </div>
                  </div>
                  <div v-if="section.media_assets.length > 1" v-for="asset in section.media_assets" :key="asset.id" class="col-md-6 col-sm-12 text-center">
                    <div class="image">
                      <div class="text">
                        {{asset.description}}
                      </div>
                      <a :href="asset.image" target="_blank"><b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded section-img"></b-img></a>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- <img src="./images/newsletter_footer_triangle.png" class='triangle'/> -->
      <div id='container'>
        <div id="triangle-box">
          <div id="triangle"></div>
        </div>
      </div>

      <!-- Footer -->
      <div class='footer-newsletter text-center'>
        <p>FIDEICOMISO METRO 19 - INFORMACIÓN PRODUCIDA POR METRO BUILDING S.A.</p>
      </div>
    </div>
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
      main_image: null,
      variablesToReplace: null,
      viewType: null
    }
  },
  mounted: function() {
    var url;

    if(this.$root.viewType == 'admin') {
      url = '/admin/newsletters/' + this.$root.newsletterId + '.json';
    } else {
      url = '/site/sent_newsletters/' + this.$root.sentNewsletterToken + '.json'
    }

    axios({ method: 'get',
            url: url
          })
    .then(response => {
      this.newsletter_title = response.data.title
      this.newsletter_id = response.data.id
      this.sections = response.data.newsletter_sections
      this.logo_url = response.data.logo_url
      this.main_image = response.data.main_image
      this.viewType = this.$root.viewType
      if(response.data.variables_to_replace) {
        this.variablesToReplace = response.data.variables_to_replace
        this.replaceVariables();
      }
    })
  },
  methods: {
    replaceVariables () {
      for(var i = 0; i < this.sections.length; i++) {
        var section = this.sections[i];

        for(var key in this.variablesToReplace) {
          section.description = section.description.replace(key, this.variablesToReplace[key]);
        }
      }
    }
  }
}
</script>

<style scoped>

.admin-newsletter-view {
  font-family: 'brown';
}

.admin-newsletter-view header {
	 background-image: url('./images/masterhead.jpg');
	 background-repeat: no-repeat;
	 background-attachment: scroll;
	 background-position: center center;
	 background-size: cover;
	 height: 500px;
}

.admin-newsletter-view header .title-newsletter-container {
	 color: white;
	 margin-top: 175px;
	 background: rgba(46, 49, 49, 0.5);
	 padding: 10px;
}

.admin-newsletter-view header .title-newsletter-container .main-title {
	 font-size: 70px;
	 font-weight: bold;
}

.admin-newsletter-view header .title-newsletter-container .subtitle {
	 font-size: 17px;
	 text-transform: uppercase;
}

.admin-newsletter-view .newsletter-small-title {
	 font-size: 12px;
	 text-align: left;
	 text-transform: uppercase;
}


#container {
  display: flex;
}

#triangle-box {
  flex: 1;
}

#triangle {
  background-image: linear-gradient(to right top, #00c9fc 0%, #00c9fc 50%, transparent 50%);
  width: 100%;
  height: 350px;
  top: 0;
  left: 0;
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

.admin-newsletter-view .container {
	 width: 95%;
}

.admin-newsletter-view .title-newsletter {
	 font-size: 50px;
	 color: #333;
}

.admin-newsletter-view .dividing-bar {
	 height: 15px;
	 border-radius: 0.25rem;
	 background-color: #1c7363;
	 color: white;
}

.admin-newsletter-view .sections {
	 margin-bottom: 150px;
	 background-size: cover;
}

.admin-newsletter-view .sections .section .title {
	 background-color: #00c9fc;
	 color: white;
	 border: 2px solid #00c9fc;
	 border-radius: 0.25rem;
	 text-transform: uppercase;
	 margin-bottom: inherit;
	 margin-top: 40px;
	 font-weight: bolder;
	 font-size: 20px;
}

.admin-newsletter-view .sections .section .description {
	 margin-top: 2%;
	 margin-bottom: 3%;
}

.admin-newsletter-view .footer-newsletter {
	 height: 52px;
	 background-color: #333;
	 border-top: 1px solid #333;
	 color: white;
}

.admin-newsletter-view .footer-newsletter p {
	 padding-top: 12px;
}

.description {
  font-size: 17px;
}

.section .image {
  display: inline-block;
  color: white;
  font-size: 14px;
}

.section .image .text{
  font-weight: bold;
  text-shadow: 1px 1px 1px black;
  text-transform: uppercase;
  position: absolute;
  top: 49%;
  z-index: 1;
  text-align: center;
  width: 360px;
  letter-spacing: 0.5px;
}

.section .image img{
  filter: brightness(80%);
}

img.section-img{
  width: 350px;
  height: 350px;
  margin: 5px;
}
.one-image{
  width: 100%;
}
</style>
