<template>
  <div id="app" class="container-fluid">

    <h1>Nueva Circular</h1>

    <div class="row wrapper">
      <div class='col-xs-12 col-sm-12 col-md-10 main'>
        <form id="newsletter_form" enctype="multipart/form-data" action="/admin/newsletters" accept-charset="UTF-8" method="post">


          <!-- <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="iNgPk+X9Wfgf/ej7PVM+9P749aAK9XKJyDqENG2ucOPLiKjJCrl0VEOaQJcHAX8gde1oP7Y9ds1V/FsQLJJKZw==">
           -->
          <br>
          <br>
          <div class="form-group">
            <label for="newsletter_title"> TÍTULO DE LA CIRCULAR </label>
            <input class="form-control" type="text" name="newsletter[title]" :value="title" id="newsletter_title">
          </div>
          <br>
          <br>

          <draggable v-model="sections" group="sections" @start="drag=true" @end="onDrop" ghost-class="ghost">
              <div v-for="section in sections" :key="section.id">
                <newsletter-section :section="section"></newsletter-section>
              </div>
          </draggable>

          <a class="btn btn-primary" v-on:click="addSection()">Agregar Sección</a>

          <div class="form-actions">
            <div class="btn-group actions" role="group">
              <b-button @click="resetPreview()" v-b-modal.modal-tall class="btn btn-info mb-2">Vista previa</b-button>
            </div>

            <div class="btn-group actions" role="group">
              <input type="submit" name="save" value="Guardar" class="btn btn-success mb-2" data-disable-with="Guardar">
            </div>
          </div>

        </form>

        <notifications group="alerts" position="top left"/>

      </div>

      <sidebar></sidebar>
      <b-modal id="modal-tall" scrollable title="Vista Previa">
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
import { ModalPlugin } from 'bootstrap-vue'
Vue.use(ModalPlugin)
import Vue from 'vue'

export default {
  data: function () {
    return {
      id: null,
      title: "Newsletter 1",
      sections: [],
      newsletterPreviewId: 0
    }
  },
  components: { NewsletterSection, draggable, Sidebar, ModalPlugin, NewsletterPreview },
  mounted: function() {
    axios({ method: 'get',
            url: '/admin/newsletters/' + this.$root.newsletterId + '.json'
          })
    .then(response => {
      console.log(response.data)
      this.title = response.data.title
      this.id = response.data.id
      this.sections = response.data.newsletter_sections
    })
  },
  methods: {
    addSection() {
      axios.post('/admin/newsletters/' + this.$root.newsletterId + '/newsletter_sections.json')
      .then(response => {
        console.log('Response from new section: ');
        console.log(response);
        this.sections.push(response.data);
        console.log('Sections: ');
        console.log(this.sections);
        this.$notify({
          group: 'alerts',
          type: 'success',
          title: 'Nueva sección',
          text: 'Sección agregada correctamente'
        });
      })
      .catch(error => {
        console.log(error);
        this.$notify({
          group: 'alerts',
          type: 'error',
          title: 'Nueva sección',
          text: 'Ocurrió un error y la sección no pudo ser agregada'
        });
      })
    },
    onDrop() {
      this.drag = false;
      var newsletterIds = this.sections.map(function(section) { return section.id })
      console.log(newsletterIds)
      axios.put('/admin/newsletters/' + this.$root.newsletterId + '/sort_sections', {
        newsletter_section_ids: newsletterIds
      }).then(response => {
        this.$notify({
          group: 'alerts',
          type: 'success',
          title: 'Circular guardada',
          text: 'Posicionamiento cambiado correctamente'
        });
      })
    },
    resetPreview() {
      this.newsletterPreviewId += 1
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
</style>
