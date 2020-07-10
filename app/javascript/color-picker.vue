<template>
  <div class="btn-group colorpicker">
    <div class="panel panel-default">
      <div class="text-center panel-heading">COLOR DE LA NEWSLETTER</div>
      <div class="text-center panel-body">
        <a class="label dropdown-toggle" :style="'background-color:' + value" type="button" data-toggle="dropdown">
          <slot>{{ content }}</slot>
        </a>

        <ul class="dropdown-menu dropdown-margins" role="menu">
          <li v-for="colo in colors">
            <a class="label text-left" :style="'background-color:' + colo"  @click="picked(colo)">
              <i v-if="colo === value" class="glyphicon glyphicon-ok"></i>
              <i v-else></i>
            </a>
          </li>
        </ul>
     </div>
   </div>
 </div>
</template>
<script>
  export default {
    props: {
      value: String,
      content: {
        type: String,
        default: function () {
          return ' ~ PKAQ ~ '
        }
      },
      colors: {
        type: Array,
        default: function () {
          return ['#707070', '#9386BD', '#D74063', '#F4889F', '#8B7366', '#7d6741', '#777777', '#00c9fc', '#1c7363', '#1C5773', '#731C57', '#631C73', '#1C2C73', '#381C73', '#000000', '#CCCCCC']
        }
      }
    },
    methods: {
      picked: function (color) {
        this.$emit('input', color)
      }
    }
  }
</script>
<style>
.colorpicker a{
  color: #FFF;
  background :#cfcfcf;
  padding: 10px;
  font-size: 14px;
  font-weight: normal;
}
.colorpicker a:hover{
  color: #cfcfcf;
}
.colorpicker ul {
  width:373px;
}
.colorpicker ul li{
  float: left;
  width: 36px;
  height: 36px;
  margin: 3px 5px;
}
.colorpicker ul li a i{
  color: #fff;
  left: -5px;
}
.colorpicker ul li a{
  width: 100%;
  height: 100%;
  line-height: 30px;
  text-align: center;
  display: block;
  cursor: pointer;
}
.colorpicker ul li a:hover{
  border: 1px #c3c3c3 dashed;
}
.dropdown-margins {
  left: 75px;
  right: 75px;
}
</style>
