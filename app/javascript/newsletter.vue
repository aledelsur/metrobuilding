<template>
  <div id="app" class='container'>
    <h1>Nueva Circular</h1>

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

      <button class="btn btn-primary" v-on:click="addSection()">Agregar Sección</button>

      <div class="form-actions">
        <div class="btn-group actions" role="group">
          <input type="submit" name="preview" value="Vista previa" class="btn btn-info mb-2" data-disable-with="Vista previa">
        </div>

        <div class="btn-group actions" role="group">
          <input type="submit" name="save" value="Guardar" class="btn btn-success mb-2" data-disable-with="Guardar">
        </div>
      </div>

    </form>

    <notifications group="alerts" position="bottom left"/>

  </div>
</template>

<script>
import NewsletterSection from './newsletter-section.vue'
import axios from 'axios';
import draggable from 'vuedraggable'

export default {
  data: function () {
    return {
      id: null,
      title: "Newsletter 1",
      sections: []
    }
  },
  components: { NewsletterSection, draggable },
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
      axios.post('/admin/newsletters/' + this.$root.newsletterId + '/newsletter_sections')
      .then(response => {
        console.log('Response from new section: ');
        console.log(response);
        this.sections.push(response.data);
        console.log('Sections: ');
        console.log(this.sections);
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
    }

  }
}
</script>

<style scoped>
  .ghost {
    visibility: hidden;
  }
</style>
