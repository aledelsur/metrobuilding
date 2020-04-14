<template>
  <div>
    <div class="panel panel-default newsletter-section">
      <div class="panel-heading grabbable" @click='visible = !visible'>
        {{ title }}
        <a class="btn btn-danger remove-section pull-right" data-confirm="Estás seguro que deseas eliminar esta sección?" v-on:click="removeSection">Eliminar</a>
      </div>
      <b-collapse v-model="visible" class="mt-2">
        <b-card>
          <div class="panel-body">
            <div class="form-group">
              <label for="newsletter_newsletter_sections_attributes_0_title"> Tītulo de la sección </label>
              <input class="form-control" type="text" v-model="title">
            </div>

            <div class="form-group">
              <label for="newsletter_newsletter_sections_attributes_0_description">Descripción de la sección</label>

              <vue-ckeditor
              v-model="description"
              :config="config" />

              <div class="section-assets" style="overflow: hidden;">
                <div v-for="asset in sectionAssets" style="float: left; width: 200px;">
                  <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded" style="width: 200px;"></b-img>
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
// Vue.use(IconsPlugin)
import { ModalPlugin } from 'bootstrap-vue'
Vue.use(ModalPlugin)
import MediaAssetLibrary from './media-asset-library.vue'
import Vue from 'vue'

export default {
  props: ['section'],
  name: 'newsletter-section',
  components: {VueCkeditor, ModalPlugin, MediaAssetLibrary},
  data: function () {
    return {
      id: 0,
      position: 1,
      title: null,
      description: '<p>Rich-text editor content.</p>',
      sectionAssets: [],
      visible: false,
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
    this.id = this.section.id
    this.title = this.section.title
    this.description = this.section.description
    this.position = this.section.position
    this.sectionAssets = this.section.media_assets
  },
  methods:  {
    removeSection() {
      axios({ method: 'delete',
              url:'/admin/newsletters/' + this.section.newsletter_id + '/newsletter_sections/' + this.id })
      .then(response => {
        this.$parent.$parent.sections = response.data;
      })
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
</style>
