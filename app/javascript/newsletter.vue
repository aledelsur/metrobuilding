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

      <div id="newsletter_sections" data-url="" class="ui-sortable" v-for="section in sections">

        <newsletter-section :section="section"></newsletter-section>

        <button class="btn" v-on:click="addSection()">Agregar Seccion</button>
      </div>

      <div class="btn-group">
        <input type="submit" name="commit" value="Agregar nueva sección" class="btn btn-primary mb-2" data-disable-with="Agregar nueva sección">
      </div>

      <div class="form-actions">
        <div class="btn-group actions" role="group">
          <input type="submit" name="preview" value="Vista previa" class="btn btn-info mb-2" data-disable-with="Vista previa">
        </div>

        <div class="btn-group actions" role="group">
          <input type="submit" name="save" value="Guardar" class="btn btn-success mb-2" data-disable-with="Guardar">
        </div>
      </div>

    </form>

  </div>
</template>

<script>
import NewsletterSection from './newsletter-section.vue'
import axios from 'axios';

export default {
  data: function () {
    return {
      id: null,
      title: "Newsletter 1",
      sections: []
    }
  },
  components: { NewsletterSection },
  mounted: function() {
    axios.get('/admin/newsletters/' + this.$root.newsletterId)
    .then(response => {
      console.log(response.data)
      this.title = response.data.title
      this.id = response.data.id
      this.sections = response.data.newsletter_sections
    })
  },
  methods: {
    addSection () {
      axios.post('/admin/newsletters/' + this.$root.newsletterId + '/newsletetter_sections')
      .then(response => {
        console.log(response)
        newSection = {
          title: response.data.title,
          description: response.data.description,
          position: response.data.position
        }
        this.sections = this.sections + newSection
      })
    }
  }
}
</script>

<style scoped>

</style>
