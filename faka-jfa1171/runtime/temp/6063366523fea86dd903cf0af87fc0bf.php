<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/plugs/upfile.html";i:1646323578;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title><?php echo sysconf('app_name'); ?> <?php echo getVersion(); ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="../image/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0">
    <link href="/static/plugs/uploader/webuploader.css" rel="stylesheet" type="text/css"/>
    <link href="/static/plugs/uploader/theme/uploader.css" rel="stylesheet" type="text/css"/>
    <script src="/static/plugs/jquery/jquery.min.js"></script>
    <script src="/static/plugs/uploader/webuploader.min.js"></script>
    <script src="/static/plugs/uploader/theme/upload.js"></script>
</head>
<body>
<div id="uploader">
    <div class="queueList">
        <div id="dndArea" class="placeholder">
            <div id="filePicker"></div>
        </div>
    </div>
    <div class="statusBar" style="display:none;">
        <div class="progress">
            <span class="text">0%</span>
            <span class="percentage"></span>
        </div>
        <div class="info"></div>
        <div class="btns">
            <?php if($mode!=='one'): ?>
            <div id="filePicker2"></div>
            <?php endif; ?>
            <div class="uploadBtn">开始上传</div>
        </div>
    </div>
</div>
<script>
    /* global WebUploader */

    /**
     * 每个文件上传成功调用
     * @type Function
     */
    function uploaded(ret, file) {
        var url = ret.url || ret.site_url;
        $('#' + file.id).attr('data-md5', file.md5).attr('data-src', url);
        /*<?php if($mode === 'one'): ?>*/
        top.$('[name="<?php echo $field; ?>"]').map(function () {
            top.$(this).attr('data-srcs', ret.url).attr('data-md5', file.md5).val(url).trigger('change');
        });
        var index = top.layer.getFrameIndex(window.name);
        top.layer.close(index);
        /*<?php endif; ?> <?php echo $mode; ?>*/
    }

    function confirmSelected() {
        var srcs = new Array(), md5s = new Array();
        $('[data-md5] .success').map(function () {
            var $li = $(this).parents('[data-md5]');
            md5s.push($li.attr('data-md5'));
            srcs.push($li.attr('data-src'));
        });
        if (srcs.length < 1) {
            return top.$.msg.tips('还没有选择文件,请勾选需要使用的文件！');
        }
        top.$('[name="<?php echo $field; ?>"]').map(function () {
            top.$(this).attr('data-srcs', srcs.join('|')).attr('data-md5', md5s.join('|')).val(srcs.join('|')).trigger('change');
        });
        var index = top.layer.getFrameIndex(window.name);
        top.layer.close(index);
    }

    function completed() {
        var btnHTML = '完成上传';
        $('.uploadBtn').on('click', function () {
            if (this.innerHTML === btnHTML) {
                confirmSelected.call(this);
            }
        }).html(btnHTML);
    }

    // 当domReady的时候开始初始化
    $(function () {
        var $wrap = $('#uploader'),
            /*文件容器*/
            $queue = $('<ul class="filelist"></ul>').appendTo($wrap.find('.queueList')),
            /*状态栏，包括进度和控制按钮*/
            $statusBar = $wrap.find('.statusBar'),
            /*文件总体选择信息。*/
            $info = $statusBar.find('.info'),
            /*上传按钮*/
            $upload = $wrap.find('.uploadBtn'),
            /*没选择文件之前的内容。*/
            $placeHolder = $wrap.find('.placeholder'),
            $progress = $statusBar.find('.progress').hide(),
            /* 添加的文件数量*/
            fileCount = 0,
            /*添加的文件总大小*/
            fileSize = 0,
            /*优化retina, 在retina下这个值是2*/
            ratio = window.devicePixelRatio || 1,
            /*缩略图大小*/
            thumbnailWidth = 110 * ratio, thumbnailHeight = 110 * ratio,
            /*可能有pedding, ready, uploading, confirm, done.*/
            state = 'pedding',
            /*所有文件的进度信息，key为file id*/
            percentages = {},
            /*判断浏览器是否支持文件的base64*/
            isSupportBase64 = (function () {
                var data = new Image();
                var support = true;
                data.onload = data.onerror = function () {
                    if (this.width != 1 || this.height != 1) {
                        support = false;
                    }
                };
                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                return support;
            }.call(this)),
            /*检测是否已经安装flash，检测flash的版本*/
            flashVersion = (function () {
                var version;
                try {
                    version = navigator.plugins['Shockwave Flash'];
                    version = version.description;
                } catch (ex) {
                    try {
                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash').GetVariable('$version');
                    } catch (ex2) {
                        version = '0.0';
                    }
                }
                version = version.match(/\d+/g);
                return parseFloat(version[0] + '.' + version[1], 10);
            })(),
            supportTransition = (function () {
                var s = document.createElement('p').style,
                    r = 'transition' in s || 'WebkitTransition' in s || 'MozTransition' in s || 'msTransition' in s || 'OTransition' in s;
                return (s = null), r;
            })(),
            uploader;
        if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {
            /*flash 安装了但是版本过低*/
            if (flashVersion) {
                (function (container) {
                    window['expressinstallcallback'] = function (state) {
                        switch (state) {
                            case 'Download.Cancelled':
                                alert('您取消了更新！');
                                break;
                            case 'Download.Failed':
                                alert('安装失败');
                                break;
                            default:
                                alert('安装已成功，请刷新！');
                                break;
                        }
                        delete window['expressinstallcallback'];
                    };
                    var swf = '/static/plugs/uploader/expressInstall.swf';
                    var html = '<object type="application/' + 'x-shockwave-flash" data="' + swf + '" ';
                    if (WebUploader.browser.ie) {
                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                    }
                    html += 'width="100%" height="100%" style="outline:0">' +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                        '</object>';
                    container.html(html);
                })($wrap);
            } else {
                $wrap.html('<a href="//www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
            }
            return;
        } else if (!WebUploader.Uploader.support()) {
            alert('Web Uploader 不支持您的浏览器！');
            return;
        }
        // 文件上传前的检查
        WebUploader.Uploader.register({'before-send-file': 'preupload'}, {
            preupload: function (file) {
                var me = this, owner = this.owner, deferred = WebUploader.Deferred();
                owner.md5File(file.source).fail(function () {
                    deferred.reject();
                }).then(function (md5) {
                    file.md5 = md5;
                    var data = {id: file.id, md5: md5, uptype: '<?php echo $uptype; ?>', filename: file.name};
                    $.ajax("<?php echo url('admin/plugs/upstate'); ?>", {
                        dataType: 'json', method: 'post', data: data, success: function (ret) {
                            if (ret.code !== 'NOT_FOUND') {
                                owner.skipFile(file);
                                uploaded.call(uploader, ret.data, file);
                                percentages[file.id] = [file.size, 1];
                                updateTotalProgress();
                                console.log('文件秒传成功 --> ' + file.name);
                            } else {
                                file.md5 = md5;
                                file.token = ret.data.token || '';
                                file.key = ret.data.file_url || '';
                                file.site_url = ret.data.site_url || '';
                                me.options.formData.OSSAccessKeyId = ret.data.OSSAccessKeyId || ''; // OSS
                                me.options.formData.signature = ret.data.signature; // OSS
                                me.options.formData.policy = ret.data.policy; // OSS
                                me.options.formData.success_action_status = '200'; // OSS
                                me.options.server = ret.data.server;
                            }
                            deferred.resolve();
                        }
                    });
                });
                return deferred.promise();
            }
        });

        // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker',
                label: '点击选择文件',
                /*<?php if($mode === 'one'): ?>*/
                multiple: false,
                /*<?php else: ?>*/
                multiple: true,
                /*<?php endif; ?>*/
            },
            accept: {title: '选择文件', extensions: '<?php echo $types; ?>', mimeTypes: '<?php echo $mimes; ?>'},
            formData: {},
            /*<?php if($mode === 'one'): ?>*/
            auto: true,
            fileNumLimit: 1,
            /*<?php else: ?>*/
            auto: false,
            fileNumLimit: 300,
            /*<?php endif; ?>*/
            server: '<?php echo url("admin/plugs/upload"); ?>',
            swf: '/static/plugs/uploader/Uploader.swf',
            chunked: false,
            dnd: '#dndArea',
            paste: document.body,
            chunkSize: 512 * 1024,
            disableGlobalDnd: true,
            fileSizeLimit: 200 * 1024 * 1024, // 200 M
            fileSingleSizeLimit: 200 * 1024 * 1024, // 200 M
            compress: {
                width: 1600,
                height: 16000,
                crop: false, // 是否允许裁剪
                quality: 90, // 图片质量(只有type为`image/jpeg`的时候才有效)
                allowMagnify: false, // 是否允许放大(如果想要生成小图的时候不失真，此选项应该设置为false).
                preserveHeaders: true, // 是否保留头部meta信息
                noCompressIfLarger: false, // 如果发现压缩后文件大小比原来还大，则使用原来图片
                compressSize: 1024 * 512, // 单位字节(如果图片大小小于此值，不会采用压缩)
            }
        });

        /* 上传开始前的处理 */
        uploader.on('uploadBeforeSend', function (file, data, header) {
            header['X_Requested_With'] = 'XMLHttpRequest';
            data['allowed_types'] = this.options.accept[0].extensions.split(',').join('|');
            data['token'] = file.file.token;
            data['md5'] = file.file.md5;
            data['key'] = file.file.key;
        });

        /* 处理上传后的结果 */
        uploader.on('uploadAccept', function (fieldata, ret) {
            // Qiniu or Local 上传
            if (ret.code === 'SUCCESS') {
                uploaded.call(uploader, ret.data, fieldata.file);
                return true;
            }
            // AliOSS 上传
            if (fieldata.file.site_url) {
                uploaded.call(uploader, {'site_url': fieldata.file.site_url}, fieldata.file);
                return true;
            }
            // 接收服务器返回的错误消息
            fieldata.file.setStatus('error', ret.msg);
            return false;
        });

        // 拖拽时不接受 js, txt 文件。
        uploader.on('dndAccept', function (items) {
            var denied = false, len = items.length, unAllowed = 'text/plain;application/javascript ';
            for (var i = 0; i < len; i++) {
                if (~unAllowed.indexOf(items[i].type)) {
                    denied = true;
                    break;
                }
            }
            return !denied;
        });

        // 添加“添加文件”的按钮，
        uploader.addButton({id: '#filePicker2', label: '继续添加'});
        uploader.on('ready', function () {
            window.uploader = uploader;
        });

        // 当有文件添加进来时执行，负责view的创建
        function addFile(file) {
            var $li = $('<li id="' + file.id + '"><p class="title">' + file.name + '</p><p class="imgWrap"></p><p class="progress"><span></span></p></li>'),
                $btns = $('<div class="file-panel"><span class="cancel">删除</span><span class="rotateRight">向右旋转</span><span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                $prgress = $li.find('p.progress span'), $wrap = $li.find('p.imgWrap'), $info = $('<p class="error"></p>');
            var showError = function (code) {
                var text = '';
                switch (code) {
                    case 'exceed_size':
                        text = '文件大小超出';
                        break;
                    case 'interrupt':
                        text = '上传暂停';
                        break;
                    case 'http':
                    case 'server':
                    case 'abort':
                        text = '上传失败，请重试';
                        break;
                    default:
                        text = code;
                        break;
                }
                $info.text(text).appendTo($li);
            };
            if (file.getStatus() === 'invalid') {
                showError(file.statusText);
            } else {
                // @todo lazyload
                $wrap.text('预览中');
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        return $wrap.text('不能预览');
                    }
                    var img;
                    if (isSupportBase64) {
                        img = $('<img src="' + src + '">');
                        $wrap.empty().append(img);
                    } else {
                        $.ajax('{"plugs/file/preview"|url}', {method: 'post', data: src, dataType: 'json'}).done(function (response) {
                            if (response.result) {
                                img = $('<img src="' + response.result + '">');
                                $wrap.empty().append(img);
                            } else {
                                $wrap.text("预览出错");
                            }
                        });
                    }
                }, thumbnailWidth, thumbnailHeight);
                percentages[file.id] = [file.size, 0];
                file.rotation = 0;
                $upload.html('开始上传');
            }
            // 文件上传状态变化
            file.on('statuschange', function (cur, prev) {
                if (prev === 'progress') {
                    $prgress.hide().width(0);
                } else if (prev === 'queued') {
                    $li.off('mouseenter mouseleave'), $btns.remove();
                }
                if (cur === 'error' || cur === 'invalid') {
                    showError(file.statusText);
                    percentages[file.id][1] = 1;
                } else if (cur === 'interrupt') {
                    showError('interrupt');
                } else if (cur === 'queued') {
                    percentages[file.id][1] = 0;
                } else if (cur === 'progress') {
                    $info.remove(), $prgress.css('display', 'block');
                } else if (cur === 'complete') {
                    $li.append('<span class="success"></span>');
                }
                $li.removeClass('state-' + prev).addClass('state-' + cur);
            });
            $li.on('mouseenter', function () {
                $btns.stop().animate({height: 30});
            }).on('mouseleave', function () {
                $btns.stop().animate({height: 0});
            });
            $btns.on('click', 'span', function () {
                switch ($(this).index()) {
                    case 0:
                        removeFile(file);
                        return uploader.removeFile(file);
                    case 1:
                        file.rotation += 90;
                        break;
                    case 2:
                        file.rotation -= 90;
                        break;
                }
                if (supportTransition) {
                    var deg = 'rotate(' + file.rotation + 'deg)';
                    $wrap.css({'-webkit-transform': deg, '-mos-transform': deg, '-o-transform': deg, 'transform': deg});
                } else {
                    $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                }
            });
            $li.appendTo($queue);
        }

        // 负责view的销毁
        function removeFile(file) {
            delete percentages[file.id];
            updateTotalProgress();
            $('#' + file.id).off().find('.file-panel').off().end().remove();
        }

        function updateTotalProgress() {
            var loaded = 0, total = 0, spans = $progress.children(), percent;
            $.each(percentages, function (k, v) {
                total += v[0];
                loaded += v[0] * v[1];
            });
            percent = total ? loaded / total : 0;
            spans.eq(0).text(Math.round(percent * 100) + '%');
            spans.eq(1).css('width', Math.round(percent * 100) + '%');
            updateStatus();
        }

        function updateStatus() {
            var text = '', stats;
            if (state === 'ready') {
                text = '选中' + fileCount + '个文件，共' + WebUploader.formatSize(fileSize) + '。';
            } else if (state === 'confirm') {
                stats = uploader.getStats();
                if (stats.uploadFailNum) {
                    text = '已成功上传' + stats.successNum + '个文件，' + stats.uploadFailNum + '个文件上传失败，<a class="retry" href="#">重新上传</a>失败文件'
                }
            } else {
                stats = uploader.getStats();
                text = '共' + fileCount + '个（' + WebUploader.formatSize(fileSize) + '），已上传' + stats.successNum + '个';
                if (stats.uploadFailNum) {
                    text += '，失败' + stats.uploadFailNum + '个';
                }
            }
            $info.html(text);
        }

        function setState(val) {
            var stats;
            if (val === state) {
                return;
            }
            $upload.removeClass('state-' + state);
            $upload.addClass('state-' + val);
            state = val;
            switch (state) {
                case 'pedding':
                    $placeHolder.removeClass('element-invisible');
                    $queue.hide();
                    $statusBar.addClass('element-invisible');
                    uploader.refresh();
                    break;
                case 'ready':
                    $placeHolder.addClass('element-invisible');
                    $('#filePicker2').removeClass('element-invisible');
                    $queue.show();
                    $statusBar.removeClass('element-invisible');
                    uploader.refresh();
                    break;
                case 'uploading':
                    $('#filePicker2').addClass('element-invisible');
                    $progress.show();
                    $upload.text('暂停上传');
                    break;
                case 'paused':
                    $progress.show();
                    $upload.text('继续上传');
                    break;
                case 'confirm':
                    $progress.hide();
                    $('#filePicker2').removeClass('element-invisible');
                    $upload.text('开始上传');
                    stats = uploader.getStats();
                    if (stats.successNum && !stats.uploadFailNum) {
                        setState('finish');
                        return;
                    }
                    break;
                case 'finish':
                    stats = uploader.getStats();
                    if (stats.successNum) {
                        completed.call(this);
                    } else {
                        state = 'done';
                        location.reload();
                    }
                    break;
            }
            updateStatus();
        }

        uploader.onUploadProgress = function (file, percentage) {
            var $li = $('#' + file.id), $percent = $li.find('.progress span');
            $percent.css('width', percentage * 100 + '%');
            percentages[file.id][1] = percentage;
            updateTotalProgress();
        };

        uploader.onFileQueued = function (file) {
            fileCount++;
            fileSize += file.size;
            if (fileCount === 1) {
                $placeHolder.addClass('element-invisible');
                $statusBar.show();
            }
            addFile(file), setState('ready'), updateTotalProgress();
        };

        uploader.onfieldequeued = function (file) {
            fileCount--;
            fileSize -= file.size;
            !fileCount && setState('pedding');
            removeFile(file), updateTotalProgress();
        };

        uploader.on('all', function (type) {
            switch (type) {
                case 'uploadFinished':
                    return setState('confirm');
                case 'startUpload':
                    return setState('uploading');
                case 'stopUpload':
                    return setState('paused');
            }
        });

        uploader.onError = function (code) {
            alert('Error: ' + code);
        };

        $upload.on('click', function () {
            if ($(this).hasClass('disabled')) {
                return false;
            }
            if (state === 'ready') {
                uploader.upload();
            } else if (state === 'paused') {
                uploader.upload();
            } else if (state === 'uploading') {
                uploader.stop();
            }
        });

        $info.on('click', '.retry', function () {
            uploader.retry();
        });

        $upload.addClass('state-' + state);
        updateTotalProgress();
    });

</script>
</body>
</html>
