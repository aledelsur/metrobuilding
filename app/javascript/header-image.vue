<template>
  <div class="form-group">
    <div class="panel panel-default">
      <div class="text-center panel-heading"> FOTO DE PORTADA </div>
      <div class="text-center panel-body">
        <div class="col-sm-12 col-md-12">
          <b-img v-if="selectedAssetUrl" :src="selectedAssetUrl" fluid alt="Responsive image" class="header-img-thumbnail img-rounded"></b-img>
        </div>
        <div class="col-sm-12 col-md-12">
          <b-button v-on:click="showMediaAssets" class="btn btn-info mb-2">Administrar foto de portada</b-button>
        </div>
      </div>
    </div>

    <b-modal ref="my-modal-header-image" :title="modalTitle" ok-only ok-title="Cerrar" id="administrate-section-images-modal">
      <div class="library">
        <div v-for="asset in mediaAssets">
          <div class='single-image col-md-4'>
            <div class='image-container'>
              <b-img :src="asset.image" fluid alt="Responsive image" class="img-rounded section-img"></b-img>
            </div>
            <button class="btn btn-success add-button" v-on:click="addHeaderImageToNewsletter(asset.id)" v-if="!asset.is_added">Agregar</button>
            <button class="btn btn-danger delete-button" v-on:click="removeHeaderImageFromNewsletter(asset.id)" v-else>Eliminar</button>
          </div>
        </div>
      </div>
      <div class='clear'></div>
      <div class='container'>
        <pagination
            v-if="showPagination"
           :total-pages="totalPages"
           :total="total"
           :per-page="perPage"
           :current-page="currentPage"
           @pagechanged="onPageChange"
         />
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';
import Pagination from './pagination.vue'
export default {
  props: ['newsletter'],
  data: function(){
    return {
      selectedAssetUrl: '',
      mediaAssets: [],
      currentPage: 1,
      totalPages: null,
      total: null,
      perPage: 6,
      showPagination: false,
      modalTitle: 'Imágenes'
    }
  },
  components: {
    Pagination
  },
  mounted: function() {
    this.getHeaderImage()
  },
  methods: {
    onPageChange(page) {
      this.fetchMediaAssets(page)
    },
    showMediaAssets(){
      this.$refs['my-modal-header-image'].show();
      this.fetchMediaAssets(1)
    },
    addHeaderImageToNewsletter(assetId) {
      axios({ method: 'put',
              url: this.baseURL() + '/add_header_image',
              params: { id: assetId }})
      .then(response => {
        this.getHeaderImage()
        this.fetchMediaAssets(this.currentPage)
      })
    },
    removeHeaderImageFromNewsletter(assetId) {
      axios({ method: 'delete',
              url: this.baseURL() + '/remove_header_image',
              params: { id: assetId }})
      .then(response => {
        this.getHeaderImage()
        this.fetchMediaAssets(this.currentPage)
      })
    },
    fetchMediaAssets(page) {
      axios({ method: 'get',
              url: '/admin/media_assets.json',
              params: { newsletter_id: this.newsletter.id,
                        pagination: true, per_page: this.perPage,
                        current_page: page}
            })
      .then(response => {
        this.mediaAssets = response.data.serialized_records
        console.log(response.data)
        this.total = response.data.total
        this.totalPages = response.data.total_pages
        this.currentPage = response.data.current_page
        this.showPagination = true
        this.modalTitle = "Imágenes (" + this.total + " imágenes disponibles)"
      })
    },
    getHeaderImage() {
      axios({ method: 'get',
              url: '/admin/newsletters/' + this.$root.newsletterId + '/header_image.json'
            })
      .then(response => {
        console.log(response.data)
        this.selectedAssetUrl = response.data
      })
    },
    baseURL() {
      return '/admin/newsletters/' + this.$root.newsletterId
    }
  }
}
</script>

<style scoped>
  .library {
    margin-top: 20px;
  }
  .clear {
    clear: both;
  }
  .modal-body{
    height: 85%;
    overflow-y: auto;
  }
  .modal-dialog {
    margin-top: 17%;
    overflow-y: initial !important;
    width: 75%;
  }
  .modal-dialog .single-image{
    height: 250px;
  }
  .image-container {
    height: 200px;
    margin-bottom: 5px;
  }
  .modal-dialog img.section-img{
    height: 200px;
    width: 100%;
  }
  .thumbnail {
    max-width: 150px;
    max-height: 150px;
  }
  .modal-dialog .modal-content {
    min-height: 700px;
  }
  .add-button, .delete-button{
    display: block;
    width: 100%
  }
  .show-btn{
    margin-top: 10px;
  }
  .modal-footer {
    margin-top: 20px;
  }
  .header-img-thumbnail {
    max-width: 200px;
    max-height: 150px;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.428571429;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px
  }
</style>
