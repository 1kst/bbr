# 自用脚本合集



```html
<!-- 添加一个按钮 -->
<button id="copyButton">复制命令</button>

<!-- JavaScript 代码 -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const copyButton = document.getElementById('copyButton');
        const commandToCopy = 'wget https://raw.githubusercontent.com/1kst/bbr/main/666.sh && bash 666.sh';

        copyButton.addEventListener('click', () => {
            const textArea = document.createElement('textarea');
            textArea.value = commandToCopy;
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
            alert('命令已复制到剪贴板');
        });
    });
</script>


