<template>
  <div id="app" class="container-fluid">

    <h1>Nueva Circular informativa</h1>

    <div class="row wrapper">
      <div class='col-xs-12 col-sm-12 col-md-10 main'>
        <form id="newsletter_form">
          <br>
          <br>
          <div class="form-group">
            <label for="newsletter_title"> TÍTULO DE LA CIRCULAR INFORMATIVA </label>
            <input class="form-control" type="text" name="newsletter[title]" v-model="newsletter.title" id="newsletter_title">
          </div>
          <br>
          <br>

          <draggable v-model="newsletter.newsletter_sections" group="sections" @start="onStartSorting" @end="onDrop" ghost-class="ghost">
              <div v-for="section in newsletter.newsletter_sections" :key="section.id">
                <newsletter-section :section="section" :key="sectionCount"></newsletter-section>
              </div>
          </draggable>

          <a class="btn btn-primary" v-on:click="addSection()">Agregar Sección</a>

          <div class="email-content">
            <div></div>
            <label> CONTENIDO DEL EMAIL A LOS INVERSORES </label>
            <vue-ckeditor
            v-model="newsletter.email_content"
            :config="config" />
          </div>

          <div class="form-actions">
            <div class="btn-group actions" role="group">
              <b-button @click="saveNewsletter(true)" class="btn btn-success mb-2">Guardar</b-button>
            </div>
          </div>

        </form>

        <notifications group="alerts" position="top left"/>

      </div>

      <sidebar></sidebar>
      <b-modal id="previewModal" scrollable title="Vista Previa" ok-only ok-title="Cerrar">
        <newsletter-preview :key="newsletterPreviewId"></newsletter-preview>
      </b-modal>
    </div>

  </div>
</template>

<script>
import NewsletterSection from './newsletter-section.vue'
import NewsletterPreview from './newsletter-preview.vue'
import Sidebar from './sidebar.vue'
import axios from 'axios';
import draggable from 'vuedraggable'
import VueCkeditor from 'vue-ckeditor2';

export default {
  data: function () {
    return {
      sectionCount: 0,
      newsletter: {
        id: null,
        title: "Newsletter 1",
        newsletter_sections: [],
        email_content: null
      },
      newsletterPreviewId: 0,
      config: {
        toolbar: [
          { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline' ] }
        ],
        height: 200
      }
    }
  },
  components: { NewsletterSection, draggable, Sidebar, NewsletterPreview, VueCkeditor },
  mounted: function() {
    axios({ method: 'get',
            url: '/admin/newsletters/' + this.$root.newsletterId + '.json'
          })
    .then(response => {
      console.log(response.data)
      this.newsletter.title = response.data.title
      this.newsletter.id = response.data.id
      this.newsletter.email_content = response.data.email_content
      this.newsletter.newsletter_sections = response.data.newsletter_sections
    })
  },
  methods: {
    addSection() {
      axios.post('/admin/newsletters/' + this.$root.newsletterId + '/newsletter_sections.json')
      .then(response => {
        this.newsletter.newsletter_sections.push(response.data);
        this.$root.notify({
          group: 'alerts',
          type: 'success',
          title: 'Nueva sección',
          text: 'Sección agregada correctamente'
        });
      })
      .catch(error => {
        console.log(error);
        this.$root.notify({
          group: 'alerts',
          type: 'error',
          title: 'Nueva sección',
          text: 'Ocurrió un error y la sección no pudo ser agregada'
        });
      })
    },
    onStartSorting(){
      this.saveNewsletter(false)
      this.drag = true
    },
    onDrop() {
      this.drag = false
      var newsletterIds = this.newsletter.newsletter_sections.map(function(section) { return section.id })
      console.log(newsletterIds)
      axios.put('/admin/newsletters/' + this.$root.newsletterId + '/sort_sections', {
        newsletter_section_ids: newsletterIds
      }).then(response => {
        this.$root.notify({
          group: 'alerts',
          type: 'success',
          title: 'Newsletter guardada',
          text: 'Posicionamiento cambiado correctamente'
        });

        this.resetSections();
      })
    },
    saveNewsletter(withPreview) {
      axios.put('/admin/newsletters/' + this.$root.newsletterId, {
        newsletter: this.newsletter
      }).then(response => {
        if(withPreview) {
          this.$root.notify({
            group: 'alerts',
            type: 'success',
            title: 'Newsletter Guardada',
            text: 'La Newsletter ha sido actualizada correctamente'
          });

          this.$bvModal.show('previewModal')
        }

        this.resetPreview()
      })
    },
    resetPreview() {
      this.newsletterPreviewId += 1
    },
    resetSections(){
      this.sectionCount += 1;
    }

  }
}
</script>

<style scoped>

  .wrapper {
      display: flex;
      justify-content: space-between;
  }

  .main{
      min-height: 150vh;
  }

  .ghost {
    visibility: hidden;
  }
  #app{
    margin-bottom: 20px;
  }
  .email-content {
    margin-top: 3%;
    margin-bottom: 1%;
  }
</style>
