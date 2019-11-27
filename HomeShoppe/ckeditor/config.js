/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
   

    config.filebrowserBrowseUrl = '/ckeditor/ckfinder/ckfinder.aspx';

    config.filebrowserImageBrowseUrl = '/ckeditor/ckfinder/ckfinder.aspx?type=Images';

    config.filebrowserFlashBrowseUrl = 'http://localhost:49915/ckeditor/ckfinder/ckfinder.aspx?type=Flash';

    config.filebrowserUploadUrl = '/ckeditor/ckfinder/core/connector/php/connector.aspx?command=QuickUpload&type=Files';

    config.filebrowserImageUploadUrl = '/ckeditor/ckfinder/core/connector/php/connector.aspx?command=QuickUpload&type=Images';

    config.filebrowserFlashUploadUrl = 'http://localhost:49915/ckeditor/ckfinder/core/connector/php/connector.aspx?command=QuickUpload&type=Flash';
};

