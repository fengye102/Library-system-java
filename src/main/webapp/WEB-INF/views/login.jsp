<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录 - 图书借阅管理系统</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-animated.css">
</head>
<body class="auth-page">

<div id="login-page" class="page visible">
  <!-- ===== LEFT PANEL ===== -->
  <div class="left-panel">
    <div class="logo">
      <div class="logo-icon">📚</div>
      <span>图书借阅管理系统</span>
    </div>
    <div class="characters-wrapper">
      <div class="characters-scene" id="login-scene">
        <div class="character char-purple" id="l-char-purple">
          <div class="eyes" id="l-purple-eyes" style="left:45px;top:40px;gap:28px;">
            <div class="eyeball" id="l-purple-eye-l" style="width:18px;height:18px;">
              <div class="pupil" id="l-purple-pupil-l" style="width:7px;height:7px;"></div>
            </div>
            <div class="eyeball" id="l-purple-eye-r" style="width:18px;height:18px;">
              <div class="pupil" id="l-purple-pupil-r" style="width:7px;height:7px;"></div>
            </div>
          </div>
        </div>
        <div class="character char-black" id="l-char-black">
          <div class="eyes" id="l-black-eyes" style="left:26px;top:32px;gap:20px;">
            <div class="eyeball" id="l-black-eye-l" style="width:16px;height:16px;">
              <div class="pupil" id="l-black-pupil-l" style="width:6px;height:6px;"></div>
            </div>
            <div class="eyeball" id="l-black-eye-r" style="width:16px;height:16px;">
              <div class="pupil" id="l-black-pupil-r" style="width:6px;height:6px;"></div>
            </div>
          </div>
        </div>
        <div class="character char-orange" id="l-char-orange">
          <div class="eyes" id="l-orange-eyes" style="left:82px;top:90px;gap:28px;">
            <div class="bare-pupil" id="l-orange-pupil-l"></div>
            <div class="bare-pupil" id="l-orange-pupil-r"></div>
          </div>
          <div class="orange-mouth" id="l-orange-mouth" style="left:90px;top:120px;"></div>
        </div>
        <div class="character char-yellow" id="l-char-yellow">
          <div class="eyes" id="l-yellow-eyes" style="left:52px;top:40px;gap:20px;">
            <div class="bare-pupil" id="l-yellow-pupil-l"></div>
            <div class="bare-pupil" id="l-yellow-pupil-r"></div>
          </div>
          <div class="yellow-mouth" id="l-yellow-mouth" style="left:40px;top:88px;"></div>
        </div>
      </div>
    </div>
    <div class="footer-links">
      <a href="#">武汉文理学院</a>
      <a href="#">图书馆</a>
    </div>
  </div>

  <!-- ===== RIGHT PANEL ===== -->
  <div class="right-panel">
    <div class="form-container">
      <div class="sparkle-icon">
        <svg viewBox="0 0 24 24" fill="none">
          <path d="M12 2L13.5 9H10.5L12 2Z" fill="#1a1a2e"/>
          <path d="M12 22L10.5 15H13.5L12 22Z" fill="#1a1a2e"/>
          <path d="M2 12L9 10.5V13.5L2 12Z" fill="#1a1a2e"/>
          <path d="M22 12L15 13.5V10.5L22 12Z" fill="#1a1a2e"/>
        </svg>
      </div>
      <div class="form-header">
        <h1>欢迎回来！</h1>
        <p>请输入您的账号信息</p>
      </div>

      <%-- 后端错误提示 --%>
      <c:if test="${not empty error}">
        <div class="auth-error-msg visible">${error}</div>
      </c:if>
      <c:if test="${param.registered eq '1'}">
        <div class="auth-error-msg visible" style="color:#15803d;background:rgba(21,128,61,0.08);border-color:rgba(21,128,61,0.2);">
          注册成功，请登录
        </div>
      </c:if>

      <div class="auth-error-msg" id="l-error-msg"></div>

      <form id="login-form" method="post" action="${pageContext.request.contextPath}/login">
        <div class="auth-form-group">
          <label id="l-username-label" for="l-username">用户名</label>
          <div class="input-wrapper">
            <input type="text" id="l-username" name="username" placeholder="请输入用户名" autocomplete="username"/>
          </div>
        </div>

        <div class="auth-form-group">
          <label id="l-password-label" for="l-password">密码</label>
          <div class="input-wrapper">
            <input type="password" id="l-password" name="password" placeholder="••••••••"/>
            <button type="button" class="toggle-password" id="l-toggle-password">
              <svg id="l-eye-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                <circle cx="12" cy="12" r="3"></circle>
              </svg>
              <svg id="l-eye-off-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:none;">
                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                <line x1="1" y1="1" x2="23" y2="23"></line>
              </svg>
            </button>
          </div>
        </div>

        <div class="form-options">
          <label class="remember-me">
            <input type="checkbox" checked/> 记住我 30 天
          </label>
          <a href="#" class="forgot-link">忘记密码？</a>
        </div>

        <button type="submit" class="btn-auth-primary" id="l-btn-login">
          <span class="btn-text">登 录</span>
          <div class="btn-hover-content">
            <span>立即登录</span>
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </div>
        </button>
      </form>

      <div class="auth-divider-line">或</div>
      <button type="button" class="btn-auth-google" title="Google 登录功能开发中">
        <svg class="google-icon" viewBox="0 0 24 24">
          <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 01-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/>
          <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
          <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18A11.96 11.96 0 001 12c0 1.94.46 3.77 1.18 5.07l3.66-2.84v-.14z" fill="#FBBC05"/>
          <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
        </svg>
        使用 Google 登录
      </button>

      <div class="nav-link">
        没有账号？<a href="${pageContext.request.contextPath}/register">立即注册</a>
      </div>
    </div>
  </div>
</div>

<script>
// ============================================================
// LOGIN CHARACTER SYSTEM
// ============================================================
let lMX = 0, lMY = 0;
let lIsTyping = false, lIsLookingAtEachOther = false;
let lIsPurpleBlinking = false, lIsBlackBlinking = false;
let lIsPasswordFocused = false, lShowPassword = false;
let lIsLoginError = false, lErrorRecoverTimer = null;
let lTypingTimer = null;

const lUsername = document.getElementById('l-username');
const lPassword = document.getElementById('l-password');
const lToggle   = document.getElementById('l-toggle-password');
const lEyeIcon    = document.getElementById('l-eye-icon');
const lEyeOffIcon = document.getElementById('l-eye-off-icon');

document.addEventListener('mousemove', e => {
  lMX = e.clientX; lMY = e.clientY;
  if (!lIsTyping && !lIsLoginError) lUpdateChars();
});

lToggle.addEventListener('click', () => {
  lShowPassword = !lShowPassword;
  lPassword.type = lShowPassword ? 'text' : 'password';
  lEyeIcon.style.display    = lShowPassword ? 'none'  : 'block';
  lEyeOffIcon.style.display = lShowPassword ? 'block' : 'none';
  lUpdateChars();
});

lUsername.addEventListener('focus', () => lSetTyping(true));
lUsername.addEventListener('blur',  () => lSetTyping(false));
lUsername.addEventListener('input', lUpdateChars);
lPassword.addEventListener('focus', () => { lIsPasswordFocused = true;  lUpdateChars(); });
lPassword.addEventListener('blur',  () => { lIsPasswordFocused = false; lUpdateChars(); });
lPassword.addEventListener('input', lUpdateChars);

function lSetTyping(v) {
  lIsTyping = v;
  if (v) {
    lIsLookingAtEachOther = true;
    clearTimeout(lTypingTimer);
    lTypingTimer = setTimeout(() => { lIsLookingAtEachOther = false; lUpdateChars(); }, 800);
  } else { lIsLookingAtEachOther = false; }
  lUpdateChars();
}

function lScheduleBlink(flagSetter, delay) {
  setTimeout(() => {
    flagSetter(true); lUpdateChars();
    setTimeout(() => { flagSetter(false); lUpdateChars(); lScheduleBlink(flagSetter, Math.random()*4000+3000); }, 150);
  }, delay);
}
lScheduleBlink(v => lIsPurpleBlinking = v, Math.random()*4000+3000);
lScheduleBlink(v => lIsBlackBlinking  = v, Math.random()*4000+3000);

function lCalcPos(el) {
  const r = el.getBoundingClientRect();
  const cx = r.left + r.width/2, cy = r.top + r.height/3;
  const dx = lMX - cx, dy = lMY - cy;
  return {
    faceX:    Math.max(-15, Math.min(15, dx/20)),
    faceY:    Math.max(-10, Math.min(10, dy/30)),
    bodySkew: Math.max(-6,  Math.min(6,  -dx/120))
  };
}

function lCalcPupil(el, max) {
  const r = el.getBoundingClientRect();
  const dx = lMX-(r.left+r.width/2), dy = lMY-(r.top+r.height/2);
  const d = Math.min(Math.sqrt(dx*dx+dy*dy), max), a = Math.atan2(dy,dx);
  return { x: Math.cos(a)*d, y: Math.sin(a)*d };
}

function lUpdateChars() {
  const purple = document.getElementById('l-char-purple');
  const black  = document.getElementById('l-char-black');
  const orange = document.getElementById('l-char-orange');
  const yellow = document.getElementById('l-char-yellow');
  if (!purple) return;

  const pp = lCalcPos(purple), bp = lCalcPos(black);
  const op = lCalcPos(orange), yp = lCalcPos(yellow);
  const isShowPwd  = lPassword.value.length > 0 && lShowPassword;
  const isLookAway = lIsPasswordFocused && !lShowPassword;

  // Purple body
  if (isShowPwd)      { purple.style.transform = 'skewX(0deg)'; purple.style.height = '370px'; }
  else if (isLookAway){ purple.style.transform = 'skewX(-14deg) translateX(-20px)'; purple.style.height = '410px'; }
  else if (lIsTyping) { purple.style.transform = `skewX(\${(pp.bodySkew||0)-12}deg) translateX(40px)`; purple.style.height = '410px'; }
  else                { purple.style.transform = `skewX(\${pp.bodySkew}deg)`; purple.style.height = '370px'; }

  const pEyes = document.getElementById('l-purple-eyes');
  const pEyeL = document.getElementById('l-purple-eye-l'), pEyeR = document.getElementById('l-purple-eye-r');
  const pPupL = document.getElementById('l-purple-pupil-l'), pPupR = document.getElementById('l-purple-pupil-r');
  pEyeL.style.height = lIsPurpleBlinking ? '2px' : '18px';
  pEyeR.style.height = lIsPurpleBlinking ? '2px' : '18px';

  if (lIsLoginError) {
    pEyes.style.left='30px'; pEyes.style.top='55px';
    pPupL.style.transform='translate(-3px,4px)'; pPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway) {
    pEyes.style.left='20px'; pEyes.style.top='25px';
    pPupL.style.transform='translate(-5px,-5px)'; pPupR.style.transform='translate(-5px,-5px)';
  } else if (isShowPwd) {
    pEyes.style.left='20px'; pEyes.style.top='35px';
    pPupL.style.transform='translate(-4px,5px)'; pPupR.style.transform='translate(-4px,5px)';
  } else if (lIsLookingAtEachOther) {
    pEyes.style.left='55px'; pEyes.style.top='65px';
    pPupL.style.transform='translate(3px,4px)'; pPupR.style.transform='translate(3px,4px)';
  } else {
    pEyes.style.left=(45+pp.faceX)+'px'; pEyes.style.top=(40+pp.faceY)+'px';
    const po = lCalcPupil(pEyeL, 5);
    pPupL.style.transform=`translate(\${po.x}px,\${po.y}px)`; pPupR.style.transform=`translate(\${po.x}px,\${po.y}px)`;
  }

  // Black
  if (isShowPwd)              black.style.transform='skewX(0deg)';
  else if (isLookAway)        black.style.transform='skewX(12deg) translateX(-10px)';
  else if (lIsLookingAtEachOther) black.style.transform=`skewX(\${(bp.bodySkew||0)*1.5+10}deg) translateX(20px)`;
  else                        black.style.transform=`skewX(\${bp.bodySkew}deg)`;

  const bEyes = document.getElementById('l-black-eyes');
  const bEyeL = document.getElementById('l-black-eye-l'), bEyeR = document.getElementById('l-black-eye-r');
  const bPupL = document.getElementById('l-black-pupil-l'), bPupR = document.getElementById('l-black-pupil-r');
  bEyeL.style.height = lIsBlackBlinking ? '2px' : '16px';
  bEyeR.style.height = lIsBlackBlinking ? '2px' : '16px';

  if (lIsLoginError) {
    bEyes.style.left='15px'; bEyes.style.top='40px';
    bPupL.style.transform='translate(-3px,4px)'; bPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway) {
    bEyes.style.left='10px'; bEyes.style.top='20px';
    bPupL.style.transform='translate(-4px,-5px)'; bPupR.style.transform='translate(-4px,-5px)';
  } else if (isShowPwd) {
    bEyes.style.left='10px'; bEyes.style.top='28px';
    bPupL.style.transform='translate(-4px,-4px)'; bPupR.style.transform='translate(-4px,-4px)';
  } else if (lIsLookingAtEachOther) {
    bEyes.style.left='32px'; bEyes.style.top='12px';
    bPupL.style.transform='translate(0,-4px)'; bPupR.style.transform='translate(0,-4px)';
  } else {
    bEyes.style.left=(26+bp.faceX)+'px'; bEyes.style.top=(32+bp.faceY)+'px';
    const bo = lCalcPupil(bEyeL, 4);
    bPupL.style.transform=`translate(\${bo.x}px,\${bo.y}px)`; bPupR.style.transform=`translate(\${bo.x}px,\${bo.y}px)`;
  }

  // Orange
  if (isShowPwd) orange.style.transform='skewX(0deg)';
  else           orange.style.transform=`skewX(\${op.bodySkew}deg)`;
  const oEyes = document.getElementById('l-orange-eyes');
  const oPupL = document.getElementById('l-orange-pupil-l'), oPupR = document.getElementById('l-orange-pupil-r');
  if (lIsLoginError) {
    oEyes.style.left='60px'; oEyes.style.top='95px';
    oPupL.style.transform='translate(-3px,4px)'; oPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway||isShowPwd) {
    oEyes.style.left='50px'; oEyes.style.top='80px';
    oPupL.style.transform='translate(-5px,-5px)'; oPupR.style.transform='translate(-5px,-5px)';
  } else {
    oEyes.style.left=(82+op.faceX)+'px'; oEyes.style.top=(90+op.faceY)+'px';
    const oo = lCalcPupil(oPupL, 5);
    oPupL.style.transform=`translate(\${oo.x}px,\${oo.y}px)`; oPupR.style.transform=`translate(\${oo.x}px,\${oo.y}px)`;
  }

  // Yellow
  if (isShowPwd) yellow.style.transform='skewX(0deg)';
  else           yellow.style.transform=`skewX(\${yp.bodySkew}deg)`;
  const yEyes = document.getElementById('l-yellow-eyes');
  const yPupL = document.getElementById('l-yellow-pupil-l'), yPupR = document.getElementById('l-yellow-pupil-r');
  const yMouth = document.getElementById('l-yellow-mouth');
  if (lIsLoginError) {
    yEyes.style.left='35px'; yEyes.style.top='45px';
    yPupL.style.transform='translate(-3px,4px)'; yPupR.style.transform='translate(-3px,4px)';
    yMouth.style.left='30px'; yMouth.style.top='92px'; yMouth.style.transform='rotate(-8deg)';
  } else if (isLookAway||isShowPwd) {
    yEyes.style.left='20px'; yEyes.style.top='30px';
    yPupL.style.transform='translate(-5px,-5px)'; yPupR.style.transform='translate(-5px,-5px)';
    yMouth.style.left='15px'; yMouth.style.top='78px'; yMouth.style.transform='rotate(0deg)';
  } else {
    yEyes.style.left=(52+yp.faceX)+'px'; yEyes.style.top=(40+yp.faceY)+'px';
    const yo = lCalcPupil(yPupL, 5);
    yPupL.style.transform=`translate(\${yo.x}px,\${yo.y}px)`; yPupR.style.transform=`translate(\${yo.x}px,\${yo.y}px)`;
    yMouth.style.left=(40+yp.faceX)+'px'; yMouth.style.top=(88+yp.faceY)+'px'; yMouth.style.transform='rotate(0deg)';
  }
}

function lTriggerError() {
  if (lErrorRecoverTimer) { clearTimeout(lErrorRecoverTimer); lErrorRecoverTimer = null; }
  const ids = ['l-purple-eyes','l-black-eyes','l-orange-eyes','l-yellow-eyes','l-yellow-mouth','l-orange-mouth'];
  const els = ids.map(id => document.getElementById(id));
  els.forEach(el => el && el.classList.remove('shake-head'));
  void document.body.offsetHeight;
  lIsLoginError = true; lIsPasswordFocused = false; lUpdateChars();
  document.getElementById('l-orange-mouth').classList.add('visible');
  setTimeout(() => els.forEach(el => el && el.classList.add('shake-head')), 350);
  lErrorRecoverTimer = setTimeout(() => {
    lIsLoginError = false; lErrorRecoverTimer = null;
    document.getElementById('l-orange-mouth').classList.remove('visible');
    els.forEach(el => el && el.classList.remove('shake-head'));
    lUpdateChars();
  }, 2500);
}

// 前端校验（空值检查），真正的认证交给后端
document.getElementById('login-form').addEventListener('submit', function(e) {
  const username = lUsername.value.trim();
  const pwd      = lPassword.value;
  const errEl    = document.getElementById('l-error-msg');
  errEl.classList.remove('visible');
  lUsername.classList.remove('error');
  lPassword.classList.remove('error');
  document.getElementById('l-username-label').classList.remove('error-label');
  document.getElementById('l-password-label').classList.remove('error-label');

  if (!username) {
    lUsername.classList.add('error');
    document.getElementById('l-username-label').classList.add('error-label');
    errEl.textContent = '请输入用户名'; errEl.classList.add('visible');
    lTriggerError(); e.preventDefault(); return;
  }
  if (!pwd) {
    lPassword.classList.add('error');
    document.getElementById('l-password-label').classList.add('error-label');
    errEl.textContent = '请输入密码'; errEl.classList.add('visible');
    lTriggerError(); e.preventDefault(); return;
  }

  // 通过校验，显示 loading 状态后提交
  const btn = document.getElementById('l-btn-login');
  btn.querySelector('.btn-text').textContent = '登录中…';
  btn.disabled = true;
});

// 如果后端返回错误，触发角色摇头动画
(function() {
  const serverErr = document.querySelector('.auth-error-msg.visible');
  if (serverErr && serverErr.style.color !== 'rgb(21, 128, 61)') {
    lTriggerError();
  }
})();

lUpdateChars();
</script>
</body>
</html>
