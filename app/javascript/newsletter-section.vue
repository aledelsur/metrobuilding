<template>
  <div>
    <div class="panel panel-default newsletter-section">
      <div class="panel-heading grabbable" @click='visible = !visible'>
        {{ section.title }}
        <a class="btn btn-danger remove-section pull-right" v-on:click="removeSection">Eliminar</a>
      </div>
      <b-collapse v-model="visible" class="mt-2">
        <b-card>
          <div class="panel-body">
            <div class="form-group">
              <label for="newsletter_newsletter_sections_attributes_0_title"> Tītulo de la sección </label>
              <input class="form-control" type="text" v-model="section.title">
            </div>

            <div class="form-group">
              <label for="newsletter_newsletter_sections_attributes_0_description">Descripción de la sección</label>

              <vue-ckeditor
              v-model="section.description"
              :config="config" />

              <div class="section-assets row">
                <div v-for="asset in sectionAssets" class="col-md-2 text-center single-asset">
                  <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded"></b-img>
                  <div class="text-center">{{asset.description}}</div>
                </div>
              </div>

              <media-asset-library :section="section"></media-asset-library>
            </div>
          </div>
        </b-card>
      </b-collapse>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import VueCkeditor from 'vue-ckeditor2';
import MediaAssetLibrary from './media-asset-library.vue'

export default {
  props: ['section'],
  name: 'newsletter-section',
  components: { VueCkeditor, MediaAssetLibrary },
  data: function () {
    return {
      position: 1,
      sectionAssets: [],
      visible: true,
      config: {
        toolbar: [
          // { name: 'document', items: [ '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
          // { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
          // { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
          // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
          // '/',
          { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'CopyFormatting', 'RemoveFormat' ] },
          { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
          { name: 'links', items: [ 'Link', 'Unlink' ] },
          { name: 'insert', items: [ 'Table', 'HorizontalRule' ] },
          '/',
          { name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
          { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
          { name: 'tools', items: [ 'Maximize' ] }
          // { name: 'about', items: [ 'About' ] }
        ],
        height: 300
      }
    }
  },
  mounted: function() {
    // this.section.id = this.section.id
    // this.section.title = this.section.title
    // this.section.description = this.section.description

    this.position = this.section.position
    this.sectionAssets = this.section.media_assets
  },
  methods:  {
    removeSection() {
      var result = confirm("Estás seguro que querés eliminar esta sección?");
      if (result) {
        axios({ method: 'delete',
                url:'/admin/newsletters/' + this.$root.newsletterId + '/newsletter_sections/' + this.section.id })
        .then(response => {
          this.$root.notify({
            group: 'alerts',
            type: 'success',
            title: 'Sección eliminada',
            text: 'Sección eliminada correctamente.'
          })
          this.$parent.$parent.newsletter.newsletter_sections = response.data;
          this.$destroy();
        })
      }
    },

  }
}
</script>

<style>
  .fade {
    opacity: 1;
  }
  .modal-dialog .modal-title {
    font-size: 25px;
    text-align: center;
  }
  .newsletter-section .panel-heading {
    height: 38px;
  }
  .section-assets {
    overflow: hidden;
    margin-top: 1%;
  }
  .section-assets img {
    width: 150px;
    height: 150px;
    margin-bottom: 5px;
  }
  .section-assets .single-asset {
    height: 220px;
  }
</style>
