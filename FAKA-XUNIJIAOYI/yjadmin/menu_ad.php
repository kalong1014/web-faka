  <div class="d1">������</div>
  <div class="d2">
  <a href="adtype.php">������</a>
  </div>
  
  <div class="d1">��������</div>
  <div class="d2">
  <a href="helplist.php">�����б�</a>
  <a href="helplx.php">��Ӱ�����Ϣ</a>
  </div>
  
  <div class="d1">�������</div>
  <div class="d2">
  <a href="tasklist.php">��������</a>
  <a href="tasklist.php?zt=1"  class="red">��Ҫ��˵�����</a>
  <a href="taskhflist.php">�����������</a>
  <a href="taskhflist.php?zt=1"  class="red">��Ҫ��˵�����ظ�</a>
  </div>
  
  <div class="d1">��������</div>
  <div class="d2">
  <a href="gdlist.php">���й���</a>
  <? for($i=1;$i<=4;$i++){?>
  <a href="gdlist.php?gdzt=<?=$i?>"><?=returngdzt($i)?></a>
  <? }?>
  </div>










